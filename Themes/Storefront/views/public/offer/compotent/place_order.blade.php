<section class="billing-details-section">
    <div class="container">
        <checkout-offer customer-email="{{ auth()->user()->email ?? null }}" :product="{{ $product }}"
            customer-phone="{{ auth()->user()->phone ?? null }}" :default-address="{{ $defaultAddress }}"
            :addresses="{{ $addresses }}" :gateways="{{ $gateways }}" inline-template>

            <form @submit.prevent="addToCart" @input="errors.clear($event.target.name)" @change="updatePrice"
                @nice-select-updated="updatePrice">


                <div class="row">
                    <div class="col-lg-10 col-md-12">
                        <div class="billing-details-form-outer">
                            <h4 class="billing-details-title">
                                অর্ডার করতে নিচের তথ্যগুলো দিন
                            </h4>
                            <div class="billing-details-form">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="input-field-wrap">
                                            <label for="c_name">আপনার নামঃ *</label>
                                            <input type="text" name="c_name" class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-field-wrap">
                                            <label for="c_phone">মোবাইল নাম্বারঃ *</label>
                                            <input type="number" name="c_phone" class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-field-wrap">
                                            <label for="c_address">আপনার পরিপূর্ণ ঠিকানাঃ *</label>
                                            <input type="text" name="c_address" class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-field-wrap">
                                            <label for="district">আপনার জেলাঃ *</label>
                                            <input type="text" name="district" class="form-control">
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
                            <div class="cart-product-item-wrap">
                                <div class="cart-product-item-left">
                                    <img src="https://efadavasozshop.com/product/69.jpg" alt="image"
                                        class="hoverZoomLink">
                                </div>
                                <div class="cart-product-item-right">
                                    <div class="left">
                                        <h4 class="cart-product-name">
                                            {{ $product->name }}
                                        </h4>
                                    </div>
                                    <div class="right">
                                        <div class="number-picker">
                                            <label for="qty">{{ trans('storefront::product.quantity') }}</label>

                                            <div class="input-group-quantity">
                                                <input type="text" :value="cartItemForm.qty" min="1"
                                                    max="{{ $product->manage_stock ? $product->qty : '' }}"
                                                    id="qty" class="form-control input-number input-quantity"
                                                    @input="updateQuantity($event.target.value)"
                                                    @keydown.up="updateQuantity(cartItemForm.qty + 1)"
                                                    @keydown.down="updateQuantity(cartItemForm.qty - 1)">

                                                <span class="btn-wrapper">
                                                    <button type="button" class="btn btn-number btn-plus"
                                                        data-type="plus">
                                                        + </button>
                                                    <button type="button" class="btn btn-number btn-minus"
                                                        data-type="minus" disabled> - </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="product-variants">
                                @foreach ($product->options as $option)
                                    @includeIf("public.products.show.custom_options.{$option->type}")
                                @endforeach
                            </div>

                            <div class="total-payment-form">
                                <div class="sub-total-wrap">
                                    <div class="sub-total-item">
                                        <strong>Sub Total</strong>

                                        <div class="product-price" v-html="price">
                                            {!! $product->formatted_price !!}
                                        </div>
                                    </div>

                                    <div class="delivery-selection" v-if="hasShippingMethod" v-cloak>
                                        <strong>Select delivery area</strong>
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
                                        </div>
                                    </div>


                                    <div class="sub-total-item">
                                        <strong>Shipping</strong>
                                        <span>100৳</span>
                                    </div>
                                    <div class="sub-total-item grand-total">
                                        <strong>Total(Tk)</strong>

                                        <div>
                                            <input type="text" name="total" id="total" value="600"
                                                readonly="">৳
                                        </div>
                                    </div>
                                </div>
                                <h6 class="payment-item-title">
                                    Select Payment Method
                                </h6>
                                <div class="payment-items-wrap">
                                    <p>
                                        আমরা দিচ্ছি <b>ক্যাশ অন ডেলিভারিতে হোম ডেলিভারি</b> তাই পণ্য হাতে পেয়ে দেখে পণ্য
                                        রিসিভ করবেন এতে করে আপনার প্রতারিত হবার চান্স নেই।<br>
                                        <b>বিশেষ অনুরোধঃ</b> অনুগ্রহ করে অর্ডারকৃত প্রোডাক্ট টি রিসিভ করবেন।
                                    </p>
                                </div>

                                <button type="submit" class="order-place-btn-inner">
                                    Place Order
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </checkout-offer>

    </div>
</section>
