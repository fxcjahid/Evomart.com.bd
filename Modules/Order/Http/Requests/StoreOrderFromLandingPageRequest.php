<?php

namespace Modules\Order\Http\Requests;

use Illuminate\Validation\Rule;
use Modules\Core\Http\Requests\Request;
use Modules\Shipping\Facades\ShippingMethod;

class StoreOrderFromLandingPageRequest extends Request
{
    /**
     * Available attributes.
     *
     * @var string
     */
    protected $availableAttributes = 'checkout::attributes';

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array<string, string>
     */
    public function messages() : array
    {
        return [
            'fullname' => 'আপনার পূর্ণ নাম দিন.',
            'phone' => 'আপনার মোবাইল নাম্বার দিন.',
            'address' => 'আপনার সম্পূর্ণ ঠিকানা দিন.',
            'order_note' => 'অনুগ্রহ করে 1000 স্ট্রিং এর কম লিখুন.',
            'shipping_method' => 'শিপিং পদ্ধতি সিলেক্ট করুন.',
        ];
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'fullname' => 'required',
            'phone' => ['required', 'numeric', 'min:10'],
            'address' => 'required',
            'order_note' => 'max:1000',
            'shipping_method' => ['required', Rule::in(ShippingMethod::names())],
        ];
    }
}
