@extends('public.layout')

@section('title', trans('storefront::checkout.checkout'))

@section('content')
    <checkout-guest customer-email="{{ auth()->user()->email ?? null }}" customer-phone="{{ auth()->user()->phone ?? null }}"
        :addresses="{{ $addresses }}" :default-address="{{ $defaultAddress }}" :gateways="{{ $gateways }}"
        :countries="{{ json_encode($countries) }}" inline-template>
        <div id="guest_order_tabs" v-if="cartIsNotEmpty">
            <div class="modal-backdrop fade in show"></div>
            <div class="modal fade show" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <a href="{{ url()->previous() }}" data-dismiss="modal" class="close">
                            <i aria-hidden="true" class="la-times las"></i>
                        </a>
                        <div class="modal-header">
                            <h5 class="modal-title">Fill the form to order..</h5>
                        </div>

                        <div class="modal-body">
                            <form @submit.prevent="placeOrder" @input="errors.clear($event.target.name)">

                                <div class="order-product">
                                    <div class="list-inline cart-item">
                                        <div class="item-details" v-for="cartItem in cart.items" v-cloak>
                                            <img class="thumbnail" :src="cartItem.product.base_image.path" />
                                            <a class="links" target="_blank" :href="productUrl(cartItem.product)"
                                                class="product-name" v-text="cartItem.product.name"></a>
                                            <div class="summary">
                                                <span class="product-quantity" v-text="'Quantity: ' + cartItem.qty"></span>
                                                <span class="price-amount"
                                                    v-html="' | '+ cartItem.unitPrice.inCurrentCurrency.formatted"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="order-summary-account">
                                    <div class="form-group">
                                        <label for="first_name">
                                            First Name <span>*</span>
                                        </label>

                                        <input type="text" name="first_name" value="{{ old('first_name') }}"
                                            v-model="form.first_name" id="first_name" class="form-control">

                                        <span class="error-message" v-if="errors.has('first_name')"
                                            v-text="errors.get('first_name')">
                                        </span>
                                    </div>

                                    <div class="form-group">
                                        <label for="last_name">
                                            Last Name <span>*</span>
                                        </label>

                                        <input type="text" name="last_name" v-model="form.last_name" id="last_name"
                                            class="form-control">

                                        <span class="error-message" v-if="errors.has('last_name')"
                                            v-text="errors.get('last_name')">
                                        </span>
                                    </div>

                                    <div class="form-group">
                                        <label for="phone">
                                            Phone <span>*</span>
                                        </label>

                                        <input type="text" name="phone" v-model="form.phone" id="phone"
                                            class="form-control">

                                        <span class="error-message" v-if="errors.has('phone')"
                                            v-text="errors.get('phone')"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">
                                            Address <span>*</span>
                                        </label>

                                        <input type="text" name="address" v-model="form.address" id="address"
                                            class="form-control">

                                        <span class="error-message" v-if="errors.has('address')"
                                            v-text="errors.get('address')"></span>
                                    </div>

                                    <div class="form-group order-notes">
                                        <label for="order-note">
                                            Order Note
                                        </label>

                                        <textarea name="order_note" v-model="form.order_note" cols="30" rows="4" id="order_note" class="form-control"
                                            placeholder="{{ trans('storefront::checkout.special_note_for_delivery') }}"></textarea>
                                    </div>

                                </div>

                                <div class="order-payment-method" v-cloak>
                                    <h2 class="title">{{ trans('storefront::checkout.payment_method') }}</h4>

                                        <div class="payment-method-form">
                                            <div class="form-group" style="margin-bottom: -5px;">
                                                <div class="form-radio" v-for="(gateway, name) in gateways">
                                                    <input type="radio" name="form.payment_method"
                                                        v-model="form.payment_method" :value="name"
                                                        :id="name">

                                                    <label :for="name" v-text="gateway.label"></label>
                                                </div>

                                                <span class="error-message" v-if="hasNoPaymentMethod">
                                                    {{ trans('storefront::checkout.no_payment_method') }}
                                                </span>

                                                <span class="error-message" v-if="errors.has('payment_method')"
                                                    v-text="errors.get('payment_method')">
                                                </span>
                                            </div>
                                        </div>
                                </div>

                                <div class="delivery-selection" v-if="hasShippingMethod" v-cloak>
                                    <h2 class="title">Select delivery area</h2>
                                    <div class="form-group">
                                        <div class="form-radio" v-for="shippingMethod in cart.availableShippingMethods">
                                            <input type="radio" name="shipping_method" v-model="form.shipping_method"
                                                :value="shippingMethod.name" :id="shippingMethod.name"
                                                @change="updateShippingMethod(shippingMethod.name)">

                                            <label :for="shippingMethod.name" v-text="shippingMethod.label"></label>

                                            <span class="price-amount"
                                                v-html="shippingMethod.cost.inCurrentCurrency.formatted">
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="order-summary-details" v-cloak>
                                    <div class="-subtotal-amount">
                                        <label>{{ trans('storefront::cart.subtotal') }}</label>
                                        <span class="price-amount"
                                            v-html="cart.subTotal.inCurrentCurrency.formatted"></span>
                                    </div>
                                    <div class="-delivery-charge">
                                        <label>Delivery Charge</label>
                                        <span class="price-amount"
                                            v-html="cart.shippingCost.inCurrentCurrency.formatted"></span>
                                    </div>
                                    <div class="-total-amount">
                                        <label class="bold">{{ trans('storefront::cart.total') }}</label>
                                        <span class="price-amount bold"
                                            v-html="cart.total.inCurrentCurrency.formatted"></span>
                                    </div>
                                </div>

                                <div class="order-submit">
                                    <button type="submit" class="btn btn-primary btn-place-order"
                                        :class="{ 'btn-loading': placingOrder }" v-cloak>
                                        Complete your order
                                    </button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </checkout-guest>
@endsection

@push('pre-scripts')
    <script></script>
@endpush
