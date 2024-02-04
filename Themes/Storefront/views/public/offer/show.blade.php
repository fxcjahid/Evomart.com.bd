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


@section('content')
    <product-show :product="{{ $product }}" inline-template>
        <section class="product-details-wrap landingpage-wraping">
            <div class="container">

                @include('public.offer.compotent.product-details', $product)

                @include('public.offer.compotent.place_order', $product)

                <div class="product-details-bottom flex-column-reverse flex-lg-row">

                    <div class="product-details-bottom-inner">
                        <div class="product-details-tab clearfix">
                            <div class="tab-content">
                                @include('public.products.show.tab_description')
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </product-show>
@endsection
