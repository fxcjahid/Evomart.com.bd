<?php

namespace Modules\Invoice\Http\Requests;
 

use Modules\Core\Http\Requests\Request;
use Illuminate\Validation\Rule;
use Modules\Payment\Facades\Gateway;
use Modules\Shipping\Facades\ShippingMethod;

class StoreInvoiceRequest extends Request
{

    /**
     * Available attributes.
     * Translate error message
     *
     * @var string
     */
    protected $availableAttributes = 'Invoice::attributes';

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'selected_products'     => 'required',
			'invoice_number'		=> 'numeric|unique:orders,id',
            'customer_name'   		=> 'required', 
            'customer_phone'        => 'required|numeric', 
            'customer_address'      => 'required', 
            'payment_method'        => ['required', Rule::in(Gateway::names())],
            'shipping_method'       => ['required', Rule::in(ShippingMethod::names())],
        ];
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}
