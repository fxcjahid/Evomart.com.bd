<?php

namespace Modules\Order\Http\Requests;

use Illuminate\Validation\Rule;
use Modules\Core\Http\Requests\Request;

class StoreOrderGuestRequest extends Request {
    /**
     * Available attributes.
     *
     * @var string
     */
    protected $availableAttributes = 'checkout::attributes';

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        return [
            'first_name'     => 'required',
            'last_name'      => 'required',
            'phone'          => ['required', 'numeric'],
            'address'        => 'required',
            'payment_method' => 'required',
        ];
    }
}
