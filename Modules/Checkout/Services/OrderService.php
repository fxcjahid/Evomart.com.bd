<?php

namespace Modules\Checkout\Services;

use Modules\Address\Entities\Address;
use Modules\Address\Entities\DefaultAddress;
use Modules\Cart\CartItem;
use Modules\Cart\CartTax;
use Modules\Cart\Facades\Cart;
use Modules\Currency\Entities\CurrencyRate;
use Modules\FlashSale\Entities\FlashSale;
use Modules\Order\Entities\Order;
use Modules\Shipping\Facades\ShippingMethod;

class OrderService
{
    public function create($request)
    {

        $this->mergeShippingAddress($request);
        $this->saveAddress($request);
        $this->addShippingMethodToCart($request);

        return tap($this->store($request), function ($order) {
            $this->storeOrderProducts($order);
            $this->storeOrderDownloads($order);
            $this->storeFlashSaleProductOrders($order);
            $this->incrementCouponUsage($order);
            $this->attachTaxes($order);
            $this->reduceStock();
        });
    }

    private function mergeShippingAddress($request)
    {
        $request->merge([
            'shipping' => $request->ship_to_a_different_address ? $request->shipping : $request->billing,
        ]);
    }

    private function saveAddress($request)
    {
        if (auth()->guest()) {
            return;
        }

        if ($request->newBillingAddress) {
            $address = auth()
                ->user()
                ->addresses()
                ->create($this->extractAddress($request->billing));

            $this->makeDefaultAddress($address);
        }

        if ($request->ship_to_a_different_address && $request->newShippingAddress) {
            auth()
                ->user()
                ->addresses()
                ->create($this->extractAddress($request->shipping));
        }
    }

    private function extractAddress($data)
    {
        return [
            'first_name' => $data['first_name'],
            'last_name'  => $data['last_name'],
            'address_1'  => $data['address_1'],
            'address_2'  => $data['address_2'] ?? null,
            'city'       => $data['city'],
            'state'      => $data['state'],
            'zip'        => $data['zip'],
            'country'    => $data['country'],
        ];
    }

    private function makeDefaultAddress(Address $address)
    {
        if (
            auth()
                ->user()
                ->addresses()
                ->count() > 1
        ) {
            return;
        }

        DefaultAddress::create([
            'address_id'  => $address->id,
            'customer_id' => auth()->id(),
        ]);
    }

    private function addShippingMethodToCart($request)
    {
        if (! Cart::allItemsAreVirtual() && ! Cart::hasShippingMethod()) {
            Cart::addShippingMethod(ShippingMethod::get($request->shipping_method));
        }
    }

    private function customerName($request)
    {
        if ($request->fullname) {
            $fullname = $request->fullname;
        } else {
            $fullname = $request->last_name ?? $request->billing['last_name'];
        }

        /** 
         * Split the full name into an array using a space as the delimiter
         */
        $nameParts = explode(' ', $fullname);

        /**
         * Initialize first and last name
         */
        $firstName = '';
        $lastName  = '';

        /**
         * Extract first and last names based on the number of parts
         */
        if (count($nameParts) > 0) {
            $firstName = $nameParts[0];
            if (count($nameParts) > 1) {
                $lastName = implode(' ', array_slice($nameParts, 1));
            }
        }

        /**
         * Return an object with first_name and last_name properties
         */
        return (object) [
            'firstName' => $firstName,
            'lastName'  => $lastName,
            'fullName'  => $fullname,
        ];
    }

    private function store($request)
    {
        return Order::create([
            'customer_id'         => auth()->id(),
            'customer_first_name' => $this->customerName($request)->firstName,
            'customer_last_name'  => $this->customerName($request)->lastName,
            'customer_name'       => $this->customerName($request)->fullName,
            'customer_email'      => $request->customer_email ?? null,
            'customer_phone'      => $request->billing['phone'] ?? $request->phone,

            'billing_first_name'  => $this->customerName($request)->firstName,
            'billing_last_name'   => $this->customerName($request)->lastName,
            'billing_address_1'   => $request->address ?? $request->billing['address_1'],
            'billing_address_2'   => $request->billing['address_2'] ?? null,
            'billing_city'        => $request->billing['city'] ?? null,
            'billing_state'       => $request->billing['state'] ?? null,
            'billing_zip'         => $request->billing['zip'] ?? null,
            'billing_country'     => $request->billing['country'] ?? null,

            'shipping_first_name' => $this->customerName($request)->firstName,
            'shipping_last_name'  => $this->customerName($request)->lastName,
            'shipping_address_1'  => $request->address ?? $request->shipping['address_1'],
            'shipping_address_2'  => $request->shipping['address_2'] ?? null,
            'shipping_city'       => $request->shipping['city'] ?? null,
            'shipping_state'      => $request->shipping['state'] ?? null,
            'shipping_zip'        => $request->shipping['zip'] ?? null,
            'shipping_country'    => $request->shipping['country'] ?? null,

            'sub_total'           => Cart::subTotal()->amount(),
            'shipping_method'     => Cart::shippingMethod()->name(),
            'shipping_cost'       => Cart::shippingCost()->amount(),
            'coupon_id'           => Cart::coupon()->id(),
            'discount'            => Cart::discount()->amount(),
            'advance_pay'         => 0.00,
            'due_amount'          => Cart::total()->amount(),
            'total'               => Cart::total()->amount(),
            'payment_method'      => $request->payment_method,
            'currency'            => currency(),
            'currency_rate'       => CurrencyRate::for(currency()),
            'locale'              => locale(),
            'status'              => Order::PENDING_PAYMENT,
            'note'                => $request->order_note,
        ]);
    }

    private function storeOrderProducts(Order $order)
    {
        Cart::items()->each(function (CartItem $cartItem) use ($order) {
            $order->storeProducts($cartItem);
        });
    }

    private function storeOrderDownloads(Order $order)
    {
        Cart::items()->each(function (CartItem $cartItem) use ($order) {
            $order->storeDownloads($cartItem);
        });
    }

    private function storeFlashSaleProductOrders(Order $order)
    {
        Cart::items()->each(function (CartItem $cartItem) use ($order) {
            if (! FlashSale::contains($cartItem->product)) {
                return;
            }

            FlashSale::pivot($cartItem->product)
                ->orders()
                ->attach([
                    $cartItem->product->id => [
                        'order_id' => $order->id,
                        'qty'      => $cartItem->qty,
                    ],
                ]);
        });
    }

    private function incrementCouponUsage()
    {
        Cart::coupon()->usedOnce();
    }

    private function attachTaxes(Order $order)
    {
        Cart::taxes()->each(function (CartTax $cartTax) use ($order) {
            $order->attachTax($cartTax);
        });
    }

    public function reduceStock()
    {
        Cart::reduceStock();
    }

    public function delete(Order $order)
    {
        $order->delete();

        Cart::restoreStock();
    }
}
