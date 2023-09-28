<?php

namespace Modules\Setting\Http\Requests;

use Illuminate\Validation\Rule;
use Modules\Core\Http\Requests\Request;
use Modules\Currency\Currency;
use Modules\Support\Country;
use Modules\Support\Locale;
use Modules\Support\TimeZone;

class UpdateSettingRequest extends Request {
    /**
     * Available attributes.
     *
     * @var string
     */
    protected $availableAttributes = 'setting::attributes';

    /**
     * Array of attributes that should be merged with null
     * if attribute is not found in the current request.
     *
     * @var array
     */
    private $shouldCheck = ['sms_order_statuses', 'email_order_statuses'];

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        return [
            'supported_countries.*'                => ['required', Rule::in(Country::codes())],
            'default_country'                      => 'required|in_array:supported_countries.*',
            'supported_locales.*'                  => ['required', Rule::in(Locale::codes())],
            'default_locale'                       => 'required|in_array:supported_locales.*',
            'default_timezone'                     => ['required', Rule::in(TimeZone::all())],
            'customer_role'                        => ['required', Rule::exists('roles', 'id')],
            'supported_currencies.*'               => ['required', Rule::in(Currency::codes())],
            'default_currency'                     => 'required|in_array:supported_currencies.*',

            'translatable.store_name'              => 'required',
            'store_phone'                          => ['required'],
            'store_email'                          => 'required|email',
            'store_country'                        => ['required', Rule::in(Country::codes())],

            'fixer_access_key'                     => 'required_if:currency_rate_exchange_service,fixer',
            'forge_api_key'                        => 'required_if:currency_rate_exchange_service,forge',
            'currency_data_feed_api_key'           => 'required_if:currency_rate_exchange_service,currency_data_feed',
            'auto_refresh_currency_rates'          => 'required|boolean',
            'auto_refresh_currency_rate_frequency' => ['required_if:auto_refresh_currency_rates,1', Rule::in($this->refreshFrequencies())],

            'sms_service'                          => ['nullable', Rule::in($this->smsServices())],
            'vonage_key'                           => ['required_if:sms_service,vonage'],
            'vonage_secret'                        => ['required_if:sms_service,vonage'],
            'twilio_sid'                           => ['required_if:sms_service,twilio'],
            'twilio_token'                         => ['required_if:sms_service,twilio'],
            'sms_order_statuses.*'                 => ['nullable', Rule::in($this->orderStatuses())],

            'mail_from_address'                    => 'nullable|email',
            'mail_encryption'                      => ['nullable', Rule::in($this->mailEncryptionProtocols())],

            'newsletter_enabled'                   => ['required', 'boolean'],
            'mailchimp_api_key'                    => ['required_if:newsletter_enabled,1'],
            'mailchimp_list_id'                    => ['required_if:newsletter_enabled,1'],

            'facebook_login_enabled'               => 'required|boolean',
            'facebook_login_app_id'                => 'required_if:facebook_login_enabled,1',
            'facebook_login_app_secret'            => 'required_if:facebook_login_enabled,1',

            'google_login_enabled'                 => 'required|boolean',
            'google_login_client_id'               => 'required_if:google_login_enabled,1',
            'google_login_client_secret'           => 'required_if:google_login_enabled,1',

            'free_shipping_enabled'                => 'required|boolean',
            'free_shipping_min_amount'             => 'nullable|numeric',
            'translatable.free_shipping_label'     => 'required_if:free_shipping_enabled,1',

            //TAB: Shipping Methods

            'inside_dhaka_enabled'                 => 'required|boolean',
            'translatable.inside_dhaka_label'      => 'required_if:inside_dhaka_enabled,1',
            'inside_dhaka_cost'                    => ['required_if:inside_dhaka_enabled,1', 'nullable', 'numeric'],

            'outside_dhaka_enabled'                => 'required|boolean',
            'translatable.outside_dhaka_label'     => 'required_if:outside_dhaka_enabled,1',
            'outside_dhaka_cost'                   => ['required_if:outside_dhaka_enabled,1', 'nullable', 'numeric'],

            // 'local_pickup_enabled'                 => 'required|boolean',
            // 'translatable.local_pickup_label'      => 'required_if:local_pickup_enabled,1',
            // 'local_pickup_cost'                    => ['required_if:local_pickup_enabled,1', 'nullable', 'numeric'],

            // 'flat_rate_enabled'                    => 'required|boolean',
            // 'translatable.flat_rate_label'         => 'required_if:flat_rate_enabled,1',
            // 'flat_rate_cost'                       => ['required_if:flat_rate_enabled,1', 'nullable', 'numeric'],

            // 'paypal_enabled'                          => 'required|boolean',
            // 'translatable.paypal_label'               => 'required_if:paypal_enabled,1',
            // 'translatable.paypal_description'         => 'required_if:paypal_enabled,1',
            // 'paypal_test_mode'                        => 'required|boolean',
            // 'paypal_client_id'                        => 'required_if:paypal_enabled,1',
            // 'paypal_secret'                           => 'required_if:paypal_enabled,1',

            // 'stripe_enabled'                          => 'required|boolean',
            // 'translatable.stripe_label'               => 'required_if:stripe_enabled,1',
            // 'translatable.stripe_description'         => 'required_if:stripe_enabled,1',
            // 'stripe_publishable_key'                  => 'required_if:stripe_enabled,1',
            // 'stripe_secret_key'                       => 'required_if:stripe_enabled,1',

            // 'paytm_enabled'                           => 'required|boolean',
            // 'translatable.paytm_label'                => 'required_if:paytm_enabled,1',
            // 'translatable.paytm_description'          => 'required_if:paytm_enabled,1',
            // 'paytm_merchant_id'                       => 'required_if:paytm_enabled,1',
            // 'paytm_merchant_key'                      => 'required_if:paytm_enabled,1',

            // 'razorpay_enabled'                        => 'required|boolean',
            // 'translatable.razorpay_label'             => 'required_if:razorpay_enabled,1',
            // 'translatable.razorpay_description'       => 'required_if:razorpay_enabled,1',
            // 'razorpay_key_id'                         => 'required_if:razorpay_enabled,1',
            // 'razorpay_key_secret'                     => 'required_if:razorpay_enabled,1',

            // 'instamojo_enabled'                       => 'required|boolean',
            // 'translatable.instamojo_label'            => 'required_if:instamojo_enabled,1',
            // 'translatable.instamojo_description'      => 'required_if:instamojo_enabled,1',
            // 'instamojo_test_mode'                     => 'required|boolean',
            // 'instamojo_api_key'                       => 'required_if:instamojo_enabled,1',
            // 'instamojo_auth_token'                    => 'required_if:instamojo_enabled,1',

            // 'authorizenet_enabled'                    => 'required|boolean',
            // 'translatable.authorizenet_label'         => 'required_if:authorizenet_enabled,1',
            // 'translatable.authorizenet_description'   => 'required_if:authorizenet_enabled,1',
            // 'authorizenet_test_mode'                  => 'required|boolean',
            // 'authorizenet_merchant_login_id'          => 'required_if:authorizenet_enabled,1',
            // 'authorizenet_merchant_transaction_key'   => 'required_if:authorizenet_enabled,1',

            // 'paystack_enabled'                        => 'required|boolean',
            // 'translatable.paystack_label'             => 'required_if:paystack_enabled,1',
            // 'translatable.paystack_description'       => 'required_if:paystack_enabled,1',
            // 'paystack_test_mode'                      => 'required|boolean',
            // 'paystack_public_key'                     => 'required_if:paystack_enabled,1',
            // 'paystack_secret_key'                     => 'required_if:paystack_enabled,1',

            // 'mercadopago_enabled'                     => 'required|boolean',
            // 'translatable.mercadopago_label'          => 'required_if:mercadopago_enabled,1',
            // 'translatable.mercadopago_description'    => 'required_if:mercadopago_enabled,1',
            // 'mercadopago_test_mode'                   => 'required|boolean',
            // 'mercadopago_supported_currency'          => 'required_if:mercadopago_enabled,1',
            // 'mercadopago_public_key'                  => 'required_if:mercadopago_enabled,1',
            // 'mercadopago_access_token'                => 'required_if:mercadopago_enabled,1',

            // 'flutterwave_enabled'                     => 'required|boolean',
            // 'translatable.flutterwave_label'          => 'required_if:flutterwave_enabled,1',
            // 'translatable.flutterwave_description'    => 'required_if:flutterwave_enabled,1',
            // 'flutterwave_test_mode'                   => 'required|boolean',
            // 'flutterwave_public_key'                  => 'required_if:flutterwave_enabled,1',
            // 'flutterwave_secret_key'                  => 'required_if:flutterwave_enabled,1',
            // 'flutterwave_encryption_key'              => 'required_if:flutterwave_enabled,1',

            // 'bank_transfer_enabled'                   => 'required|boolean',
            // 'translatable.bank_transfer_label'        => 'required_if:bank_transfer_enabled,1',
            // 'translatable.bank_transfer_description'  => 'required_if:bank_transfer_enabled,1',
            // 'translatable.bank_transfer_instructions' => 'required_if:bank_transfer_enabled,1',

            // 'check_payment_enabled'                   => 'required|boolean',
            // 'translatable.check_payment_label'        => 'required_if:check_payment_enabled,1',
            // 'translatable.check_payment_description'  => 'required_if:check_payment_enabled,1',
            // 'translatable.check_payment_instructions' => 'required_if:check_payment_enabled,1',

            //TAB: Payment Methods

            'cod_enabled'                          => 'required|boolean',
            'translatable.cod_label'               => 'required_if:cod_enabled,1',
            'translatable.cod_description'         => 'required_if:cod_enabled,1',

            // 'bkash_transfer_enabled'               => 'required|boolean',
            // 'translatable.bkash_transfer_label'    => 'required_if:bkash_transfer_enabled,1',

            // 'rocket_transfer_enabled'              => 'required|boolean',
            // 'translatable.rocket_transfer_label'   => 'required_if:rocket_transfer_enabled,1',
        ];
    }

    /**
     * Returns currency rate refresh frequencies..
     *
     * @return array
     */
    private function refreshFrequencies() {
        return array_keys(trans('setting::settings.form.auto_refresh_currency_rate_frequencies'));
    }

    /**
     * Returns SMS services.
     *
     * @return array
     */
    private function smsServices() {
        return array_keys(trans('sms::services'));
    }

    /**
     * Returns order statuses.
     *
     * @return array
     */
    private function orderStatuses() {
        return array_keys(trans('order::statuses'));
    }

    /**
     * Returns mail encryption protocols.
     *
     * @return array
     */
    private function mailEncryptionProtocols() {
        return array_keys(trans('setting::settings.form.mail_encryption_protocols'));
    }

    /**
     * Get data to be validated from the request.
     *
     * @return array
     */
    public function validationData() {
        foreach ($this->shouldCheck as $attribute) {
            if (!$this->has($attribute)) {
                $this->merge([$attribute => null]);
            }
        }

        return $this->all();
    }
}
