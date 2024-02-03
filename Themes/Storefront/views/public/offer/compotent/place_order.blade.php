<section class="billing-details-section" id="order-form">
    <checkout-offer :product="{{ $product }}" :gateways="{{ $gateways }}" inline-template>

        <form @submit.prevent="placeOrder" ref="form" @input="errors.clear($event.target.name)" v-if="cartIsNotEmpty">

            <div class="row">
                <div class="col-lg-10 col-md-12">
                    <div class="billing-details-form-outer">
                        <h4 class="billing-details-title">
                            অর্ডার করতে নিচের তথ্যগুলো দিন
                        </h4>
                        <div class="billing-details-form">
                            <div class="row">
                                <div class="col-xl-9">
                                    <div class="input-field-wrap">
                                        <label for="fullname">আপনার নামঃ <span>*</span></label>
                                        <input type="text" name="fullname" ref="fullname" id="fullname"
                                            class="form-control" value="{{ old('first_name') }}"
                                            :class="{ 'has-error': errors.has('fullname') }">
                                        <span class="error-message" v-if="errors.has('fullname')"
                                            v-text="errors.get('fullname')">
                                        </span>
                                    </div>
                                </div>
                                <div class="col-xl-9">
                                    <div class="input-field-wrap">
                                        <label for="phone">মোবাইল নাম্বারঃ <span>*</span></label>
                                        <input type="text" name="phone" ref="phone" id="phone"
                                            class="form-control" :class="{ 'has-error': errors.has('phone') }">
                                        <span class="error-message" v-if="errors.has('phone')"
                                            v-text="errors.get('phone')">
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-18">
                                    <div class="input-field-wrap">
                                        <label for="address">আপনার পরিপূর্ণ ঠিকানাঃ <span>*</span></label>
                                        <input type="text" name="address" ref="address" id="address"
                                            class="form-control" value="{{ old('address') }}"
                                            :class="{ 'has-error': errors.has('address') }">
                                        <span class="error-message" v-if="errors.has('address')"
                                            v-text="errors.get('address')">
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-18">
                                    <div class="input-field-wrap">
                                        <label for="order_note">আপনার মতামতঃ</label>
                                        <textarea name="order_note" ref="order_note" id="order_note" cols="30" rows="10" class="form-control"></textarea>
                                        <span class="error-message" v-if="errors.has('order_note')"
                                            v-text="errors.get('order_note')">
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="billing-details-form-outer">
                        <h4 class="billing-details-title">
                            আপনার পণ্য
                        </h4>
                        <div class="cart-product-item-wrap" v-cloak>
                            <ul>
                                <li v-for="cartItem in cart.items" :key="cartItem.id">

                                    <div class="cart-product-item-left">
                                        <img :src="baseImage(cartItem.product)"
                                            :class="{ 'image-placeholder': !hasBaseImage(cartItem.product) }"
                                            alt="product image">
                                    </div>
                                    <div class="cart-product-item-right">
                                        <div class="left">
                                            <h3 class="cart-product-name" v-text="cartItem.product.name"></h3>
                                        </div>
                                        <div class="right">
                                            <span class="product-price"
                                                v-html="cartItem.unitPrice.inCurrentCurrency.formatted"></span>

                                            <ul class="list-inline product-options" v-cloak>
                                                <li v-for="option in cartItem.options">
                                                    <label>@{{ option.name }}:</label> @{{ optionValues(option) }}
                                                </li>
                                            </ul>

                                            <div class="number-picker">
                                                <label
                                                    for="qty">{{ trans('storefront::product.quantity') }}</label>

                                                <div class="input-group-quantity">
                                                    <input type="text" v-model="cartItem.qty" min="1"
                                                        max="{{ $product->manage_stock ? $product->qty : '' }}"
                                                        id="qty" class="form-control input-number input-quantity"
                                                        @input="updateQuantity(cartItem, $event.target.value)"
                                                        @keydown.up="updateQuantity(cartItem, cartItem.qty + 1)"
                                                        @keydown.down="updateQuantity(cartItem, cartItem.qty - 1)">


                                                    <span class="btn-wrapper">
                                                        <button type="button" class="btn btn-number btn-plus"
                                                            data-type="plus">
                                                            + </button>
                                                        <button type="button" class="btn btn-number btn-minus"
                                                            data-type="minus" disabled> - </button>
                                                    </span>
                                                </div>
                                            </div>

                                            <button class="btn-remove" title="remove item" v-if="cartItem.length > 1"
                                                @click="remove(cartItem)">
                                                <i class="las la-times"></i>
                                            </button>
                                        </div>
                                    </div>

                                </li>
                            </ul>
                        </div>

                        <div class="product-variants" v-cloak>
                            @foreach ($product->options as $option)
                                @includeIf("public.products.show.custom_options.{$option->type}")
                            @endforeach
                        </div>

                        <div class="total-payment-form" :class="{ loading: loadingOrderSummary }">
                            <div class="oder-summary-wrap">

                                <div class="delivery-selection" v-if="hasShippingMethod" v-cloak>
                                    <span>Select delivery area</span>
                                    <div class="form-group">
                                        <div class="form-radio"
                                            v-for="shippingMethod in cart.availableShippingMethods">
                                            <input type="radio" name="shipping_method"
                                                v-model="form.shipping_method" :value="shippingMethod.name"
                                                :id="shippingMethod.name"
                                                @change="updateShippingMethod(shippingMethod.name)">

                                            <label :for="shippingMethod.name" v-text="shippingMethod.label"></label>

                                            <span class="price-amount"
                                                v-html="shippingMethod.cost.inCurrentCurrency.formatted">
                                            </span>
                                        </div>
                                        <span class="error-message" v-if="errors.has('shipping_method')"
                                            v-text="errors.get('shipping_method')">
                                        </span>
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

                            </div>
                            <h6 class="payment-item-title">
                                Select Payment Method
                            </h6>
                            <div class="payment-items-wrap">
                                <p>
                                    আমরা দিচ্ছি <b>ক্যাশ অন ডেলিভারিতে হোম ডেলিভারি</b> তাই পণ্য হাতে পেয়ে দেখে পণ্য
                                    রিসিভ করবেন এতে করে আপনার প্রতারিত হবার চান্স নেই।<br /><br />
                                    <b>বিশেষ অনুরোধঃ</b> অনুগ্রহ করে অর্ডারকৃত প্রোডাক্ট টি রিসিভ করবেন।
                                </p>
                            </div>

                            <button type="submit" class="order-place-btn-inner"
                                :class="{ 'btn-loading': placingOrder }" v-cloak>
                                অর্ডার করুন
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </checkout-offer>
</section>
