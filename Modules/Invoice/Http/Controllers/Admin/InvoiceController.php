<?php

namespace Modules\Invoice\Http\Controllers\Admin;

use Exception; 
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Payment\Facades\Gateway;
use Modules\Shipping\Facades\ShippingMethod;
use Modules\Product\Entities\Product;  

use Modules\Invoice\Services\InvoiceService;
use Modules\Invoice\Http\Requests\StoreInvoiceRequest;
use Modules\Invoice\Http\Requests\UpdateInvoiceRequest;
use Modules\Order\Entities\Order;

class InvoiceController extends Controller
{
    /**
     * View path of the resource.
     *
     * @var string
     */
    protected $viewPath = 'invoice::admin';


    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index(Gateway $gateway, Product $product, ShippingMethod $shippingMethod)
    {
        $gateways = $gateway::all(); 
        $products = $product::getProductsList();
        $shippingMethod = $shippingMethod::available();

        return view("{$this->viewPath}.index",
            compact('gateways', 'products', 'shippingMethod')
        );
 
    }

	public function edit(Gateway $gateway, Product $product, ShippingMethod $shippingMethod, Request $request)
	{
		$orders = Order::with(['products'])->findOrFail($request->order);
 
		$gateways = $gateway::all(); 
        $products = $product::getProductsList();
        $shippingMethod = $shippingMethod::available();

		return view("{$this->viewPath}.edit",
			compact('orders', 'gateways', 'products', 'shippingMethod')
		);
	}

    public function getProductByID(Request $request)
    {    
        $productsID = $request->get('productsID');

        foreach($productsID as $ID){
            
            $product = Product::with('options')
                ->withPrice()
                ->withBaseImage()
                ->addSelect(['id'])
                ->findOrFail($ID);
            
            $options = [];

            foreach ($product->options as $key => $option) { 
                $options[] = view("invoice::admin.form.cart.custom_options.{$option->type}", compact('option','product'))->render();
            }
 
                
            $data[] = [ 
                'id' => $product->id,
                'quantity' => 1,
                'name' => $product->name,
                'image' => $product->base_image['path'],
                'price' => $product->price,
                'options' => $product->options,
            ];     

        }
  
        return response()->json($data);
    } 
 
 
    /**
     * Store a newly created resource in storage.
     *
     * @param \Modules\Invoice\Http\Requests\StoreInvoiceRequest $request 
     * @param \Modules\Checkout\Services\OrderService $orderService
     * @return \Illuminate\Http\Response
     */
    public function create(StoreInvoiceRequest $request, InvoiceService $orderService)
    {
        
        $order = $orderService->create($request);
        
        $gateway = Gateway::get($request->payment_method);
        
        try {
            $response = $gateway->purchase($order, $request); 
        } catch (Exception $e) {
            $orderService->delete($order);

            return response()->json([
                'message' => $e->getMessage(),
            ], 403);
        }
 
        return response()->json([ 
            'redirect' => route('admin.orders.show', ['id' => $response->getOrderId()])
        ]);
    }

 
    public function update(UpdateInvoiceRequest $request, InvoiceService $invoiceService)
    { 
        
        try {
			$invoice = $invoiceService->update($request);
        } catch (Exception $e) {  
            return response()->json([
                'message' => $e->getMessage(),
            ], 403);
        }
 
        return response()->json([ 
            'redirect' => route('admin.orders.index')
        ]);  
		
    }

	
 
}
