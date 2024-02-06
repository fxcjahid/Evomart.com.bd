<section class="product-details-top landing-page-product">
    <div class="product-details-top-inner grid">

        <div class="baseImage">
            @include('public.offer.compotent.product-image')
        </div>

        <div class="productInfo">
            <div class="product-details-info landing-page">
                <div class="details-info-top">
                    <h1 class="product-name">{{ $product->name }}</h1>
                    <div class="brief-description">
                        {!! $product->short_description !!}
                    </div>
                </div>
                <div class="details-info-middle">
                    <div class="product-price" v-html="price">
                        {!! $product->formatted_price !!}
                    </div>

                    <div class="details-info-button-actions">

                        <button onclick="document.querySelector('#order-form').scrollIntoView({behavior: 'smooth'})"
                            class="btn btn-primary quick-buy">
                            <i class="las la-cart-arrow-down"></i>
                            অর্ডার করুন
                        </button>

                        <whats-app inline-template :number="{{ setting('store_phone') }}"
                            :message="'{{ urldecode($product->name) }}'">
                            <button v-on:click="openWhatsApp" class="btn whatsapp-call">
                                <i class="las la-phone"></i>
                                কল করুন
                            </button>
                        </whats-app>
                    </div>

                </div>
            </div>
        </div>

        <div class="additionalImage">
            <div class="offer-additional-image-wrap">
                @if (!$product->base_image->exists)
                    <div class="additional-image">
                        <img src="{{ asset('themes/storefront/public/images/image-placeholder.png') }}"
                            alt="Image placeholder" class="image-placeholder">
                    </div>
                @else
                    <div class="additional-image">
                        <img src="{{ $product->base_image->path }}" alt="Product image">
                    </div>
                @endif

                @foreach ($product->additional_images as $additionalImage)
                    @if (!$additionalImage->exists)
                        <div class="additional-image">
                            <img src="{{ asset('themes/storefront/public/images/image-placeholder.png') }}"
                                alt="Image placeholder" class="image-placeholder">
                        </div>
                    @else
                        <div class="additional-image">
                            <img src="{{ $additionalImage->path }}" alt="product-additional-image">
                        </div>
                    @endif
                @endforeach
            </div>
        </div>

    </div>
</section>
