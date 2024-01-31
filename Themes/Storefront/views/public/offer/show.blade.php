@extends('public.offer.layout')

@section('title', $product->name)

@push('meta')
    <meta name="title" content="{{ $product->meta->meta_title ?: $product->name }}">
    <meta name="description" content="{{ $product->meta->meta_description ?: $product->short_description }}">
    <meta name="twitter:card" content="summary">
    <meta property="og:type" content="product">
    <meta property="og:url" content="{{ url()->current() }}">
    <meta property="og:title" content="{{ $product->meta->meta_title ?: $product->name }}">
    <meta property="og:description" content="{{ $product->meta->meta_description ?: $product->short_description }}">
    <meta property="og:image" content="{{ $product->base_image->path }}">
    <meta property="og:locale" content="{{ locale() }}">

    @foreach (supported_locale_keys() as $code)
        <meta property="og:locale:alternate" content="{{ $code }}">
    @endforeach

    <meta property="product:price:amount" content="{{ $product->selling_price->convertToCurrentCurrency()->amount() }}">
    <meta property="product:price:currency" content="{{ currency() }}">
@endpush

@push('globals')
    <script>
        Evomart.langs['storefront::product.reviews'] = '{{ trans('storefront::product.reviews') }}';
        Evomart.langs['storefront::product.related_products'] = '{{ trans('storefront::product.related_products') }}';
    </script>
@endpush


@section('content')
    <product-show :product="{{ $product }}" :review-count="{{ $review->count ?? 0 }}"
        :avg-rating="{{ $review->avg_rating ?? 0 }}" inline-template>
        <section class="product-details-wrap">
            <div class="container">
                <div class="product-details-top">
                    <div class="product-details-top-inner">
                        @include('public.products.show.images')

                        <div class="product-details-info">
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

                                <form @submit.prevent="addToCart" @input="errors.clear($event.target.name)"
                                    @change="updatePrice" @nice-select-updated="updatePrice">



                                    <div class="details-info-button-actions">

                                        <button type="button" class="btn btn-primary buynow"
                                            :class="{ 'btn-loading': loadingProduct }" @click="buyProduct"
                                            {{ $product->isOutOfStock() ? 'disabled' : '' }}>
                                            <i class="las la-cart-arrow-down"></i>
                                            Buy Now
                                        </button>

                                        <button type="submit" class="btn btn-primary btn-add-to-cart addToCart"
                                            :class="{ 'btn-loading': addingToCart }"
                                            {{ $product->isOutOfStock() ? 'disabled' : '' }}>
                                            Add to cart
                                        </button>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>

                </div>

                @include('public.offer.compotent.place_order', $product)

                <div class="product-details-bottom flex-column-reverse flex-lg-row">

                    <div class="product-details-bottom-inner">
                        <div class="product-details-tab clearfix">
                            <ul class="nav nav-tabs tabs">
                                <li class="nav-item">
                                    <a href="#description" data-toggle="tab" class="nav-link"
                                        :class="{ active: activeTab === 'description' }">
                                        {{ trans('storefront::product.description') }}
                                    </a>
                                </li>

                                @if ($product->hasAnyAttribute())
                                    <li class="nav-item">
                                        <a href="#specification" data-toggle="tab" class="nav-link"
                                            :class="{ active: activeTab === 'specification' }">
                                            {{ trans('storefront::product.specification') }}
                                        </a>
                                    </li>
                                @endif

                                @if (setting('reviews_enabled'))
                                    <li class="nav-item">
                                        <a href="#reviews" data-toggle="tab" class="nav-link"
                                            :class="{ active: activeTab === 'reviews' }" v-cloak>
                                            @{{ $trans('storefront::product.reviews', {
    count: totalReviews
}) }}
                                        </a>
                                    </li>
                                @endif
                            </ul>

                            <div class="tab-content">
                                @include('public.products.show.tab_description')
                                @include('public.products.show.tab_specification')
                                @include('public.products.show.tab_reviews')
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <modal-order-methods @close="closeModal" v-if="isLogginedUser"></modal-order-methods>
        </section>
    </product-show>
@endsection

@push('scripts')
    <script src="{{ v(Theme::url('public/js/flatpickr.js')) }}"></script>
@endpush
