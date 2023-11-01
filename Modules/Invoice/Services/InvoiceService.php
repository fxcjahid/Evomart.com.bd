<?php

namespace Modules\Invoice\Services;

use Illuminate\Support\Facades\Request;
use Modules\Order\Entities\Order;
use Modules\FlashSale\Entities\FlashSale;
use Modules\Currency\Entities\CurrencyRate;
use Modules\Order\Entities\OrderProduct;
use Modules\Shipping\Facades\ShippingMethod;

use function Clue\StreamFilter\fun;

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
 
		$orders->customer_name 		= $request->customer_name;
		$orders->customer_phone 	= $request->customer_phone;
		$orders->billing_address_1  = $request->customer_address;
		$orders->courier_name 		= $request->courier_name;
		$orders->shipping_city 		= $request->shipping_city;
		$orders->note 				= $request->order_note;
		$orders->payment_method 	= $request->payment_method;
		$orders->shipping_method	= $request->shipping_method;
		$orders->discount			= $request->discount;
		$orders->advance			= $request->advance;
		$orders->due				= $request->due;
		$orders->sub_total			= $request->sub_total;
		$orders->total				= $request->total;


		$orders->save(); 
		
		return tap($this->modifyOrderProducts($request), function($order){
			return redirect()->route('admin.orders.index')
				->withErrors(['error' => 'The post doesn\'t exist']);
		});
	}
 

    private function mergeProduct($request)
    {
        $products = $request->selected_products;
  
        $this->storeProduct = $products;

    }
 

    private function store($request)
    { 
        return Order::create([ 
			'id'					=> $request->invoice_number,
            'customer_name'   		=> $request->customer_name,
            'customer_phone'        => $request->customer_phone,

			'courier_name'			=> $request->courier_name,
            'billing_address_1'     => $request->customer_address,

			'discount'              => $request->discount,
			'advance'				=> $request->advance, 
			'due'					=> $request->due,
            'total'                 => $request->total,
            'sub_total'             => $request->sub_total,
			'shipping_city'			=> $request->shipping_city,
            'shipping_cost'         => $request->shipping_cost,  
            'shipping_method'       => $request->shipping_method,
            'payment_method'        => $request->payment_method,
            'currency'              => currency(),
            'currency_rate'         => CurrencyRate::for(currency()),
            'locale'                => locale(),
            'status'                => Order::PENDING_PAYMENT,
            'note'                  => $request->order_note,
        ]);
    }
 
    private function storeOrderProducts(Order $order)
    { 
        foreach ($this->storeProduct as $key => $value)
        { 
			$line_total = ((int) $value['price']['inCurrentCurrency']['amount'] * (int) $value['quantity']);
			
            $order->products()->create([
                'product_id'    => (int) $value['id'],
                'qty'           => (int) $value['quantity'],
                'unit_price'    => (int) $value['price']['inCurrentCurrency']['amount'],
                'line_total'    => $line_total,
            ]); 
        }     
    }
 
    private function modifyOrderProducts($request)
    { 
		$orderID = $request->invoice_number;

		$destory = OrderProduct::where('order_id', $orderID)->delete(); 
		
		foreach ($request->selected_products as $value)
        { 
			$line_total = ((int) $value['price']['inCurrentCurrency']['amount'] * (int) $value['quantity']);
			
			OrderProduct::create([
				'order_id'		=> $orderID,
				'product_id'    => (int) $value['id'],
				'qty'           => (int) $value['quantity'],
				'unit_price'    => (int) $value['price']['inCurrentCurrency']['amount'],
				'line_total'    => $line_total,
			]); 
			
        }     

		return $request;
    }
  

    public function delete(Order $order)
    {
        $order->delete(); 
    }

}
