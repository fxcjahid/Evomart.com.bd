@if ($upSellProducts->isNotEmpty())
    <aside class="left-sidebar">
        <div class="vertical-products">
            <div class="vertical-products-header">
                <h4 class="section-title">{{ trans('storefront::product.you_might_also_like') }}</h4>
            </div>

            <div class="vertical-products-slider" ref="upSellProducts">
                @foreach ($upSellProducts->chunk(5) as $latestProductChunks)
                    <div class="vertical-products-slide">
                        @foreach ($latestProductChunks as $latestProduct)
                            <product-card-vertical :product="{{ $latestProduct }}"></product-card-vertical>
                        @endforeach
                    </div>
                @endforeach
            </div>
        </div>

        @if ($banner->image->exists)
            <a
                href="{{ $banner->call_to_action_url }}"
                class="banner d-none d-lg-block"
                target="{{ $banner->open_in_new_window ? '_blank' : '_self' }}"
            >
                <img src="{{ $banner->image->path }}" alt="Banner">
            </a>
        @endif
    </aside>
@endif
