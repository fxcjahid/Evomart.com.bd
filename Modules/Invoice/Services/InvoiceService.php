<?php

namespace Modules\Invoice\Services;

use Modules\Currency\Entities\CurrencyRate;
use Modules\Order\Entities\Order;
use Modules\Order\Entities\OrderProduct;

class InvoiceService
{
    public $storeProduct = [];

    public function create($request)
    {
        $this->mergeProduct($request);

        return tap($this->store($request), function ($order) {
            $this->storeOrderProducts($order);
        });
    }

    public function update($request)
    {
        $orders = Order::findOrFail($request->invoice_number);

        $orders->customer_name     = $request->customer_name;
        $orders->customer_phone    = $request->customer_phone;
        $orders->billing_address_1 = $request->customer_address;
        $orders->courier_name      = $request->courier_name;
        $orders->shipping_city     = $request->shipping_city;
        $orders->note              = $request->order_note;
        $orders->payment_method    = $request->payment_method;
        $orders->shipping_method   = $request->shipping_method;
        $orders->discount          = $request->discount;
        $orders->advance           = $request->advance;
        $orders->due               = $request->due;
        $orders->sub_total         = $request->sub_total;
        $orders->total             = $request->total;

        $orders->save();

        return tap($this->modifyOrderProducts($request), function ($order) {
            return redirect()->route('admin.orders.index')
                ->withErrors(['error' => 'The post doesn\'t exist']);
        });
    }

    private function mergeProduct($request)
    {
        $products = $request->selected_products;

        $this->storeProduct = $products;

    }

    private function getFirstName($name)
    {
        $nameParts = explode(" ", $name);
        return $nameParts[0];
    }

    private function getLastName($name)
    {
        $nameParts = explode(" ", $name);
        return end($nameParts);
    }

    private function store($request)
    {
        $firstName = $this->getFirstName($request->customer_name);
        $lastName  = $this->getLastName($request->customer_name);

        return Order::create([
            'id'                  => $request->invoice_number,
            'customer_phone'      => $request->customer_phone,
            'customer_name'       => $request->customer_name,
            'customer_first_name' => $firstName,
            'customer_last_name'  => $lastName,

            'billing_first_name'  => $firstName,
            'billing_last_name'   => $lastName,
            'billing_address_1'   => $request->customer_address,
            'billing_city'        => $request->shipping_city,
            'billing_cost'        => $request->shipping_cost,
            'billing_method'      => $request->shipping_method,

            'shipping_first_name' => $firstName,
            'shipping_last_name'  => $lastName,
            'shipping_address_1'  => $request->customer_address,
            'shipping_city'       => $request->shipping_city,
            'shipping_cost'       => $request->shipping_cost,
            'shipping_method'     => $request->shipping_method,

            'same_address'        => true,

            'courier_name'        => $request->courier_name,
            'create_by'           => auth()->user()->fullname,
            'creator_id'          => auth()->user()->id,

            'discount'            => $request->discount,
            'advance_pay'         => $request->advance,
            'due_amount'          => $request->due,
            'total'               => $request->total,
            'sub_total'           => $request->sub_total,
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
        foreach ($this->storeProduct as $key => $value) {
            $line_total = ((int) $value['price']['inCurrentCurrency']['amount'] * (int) $value['quantity']);

            $order->products()->create([
                'product_id' => (int) $value['id'],
                'qty'        => (int) $value['quantity'],
                'unit_price' => (int) $value['price']['inCurrentCurrency']['amount'],
                'line_total' => $line_total,
            ]);
        }
    }

    private function modifyOrderProducts($request)
    {
        $orderID = $request->invoice_number;

        $destory = OrderProduct::where('order_id', $orderID)->delete();

        foreach ($request->selected_products as $value) {
            $line_total = ((int) $value['price']['inCurrentCurrency']['amount'] * (int) $value['quantity']);

            OrderProduct::create([
                'order_id'   => $orderID,
                'product_id' => (int) $value['id'],
                'qty'        => (int) $value['quantity'],
                'unit_price' => (int) $value['price']['inCurrentCurrency']['amount'],
                'line_total' => $line_total,
            ]);

        }

        return $request;
    }

    public function delete(Order $order)
    {
        $order->delete();
    }

}
