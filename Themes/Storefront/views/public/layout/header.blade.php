<header class="header-wrap">
    <div class="header-wrap-inner">
        <div class="container">
            <div class="row flex-nowrap justify-content-between position-relative">
                <div class="header-column-left">
                    <div class="sidebar-menu-icon-wrap">
                        <div class="sidebar-menu-icon">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </div>

                    <a href="{{ route('home') }}" class="header-logo">
                        @if (is_null($logo))
                            <h3>{{ setting('store_name') }}</h3>
                        @else
                            <img src="{{ $logo }}" alt="logo">
                        @endif
                    </a>
                </div>

                <header-search :categories="{{ $categories }}" :most-searched-keywords="{{ $mostSearchedKeywords }}"
                    is-most-searched-keywords-enabled="{{ setting('storefront_most_searched_keywords_enabled') }}"
                    initial-query="{{ request('query') }}" initial-category="{{ request('category') }}">
                </header-search>

                <div class="header-column-right d-flex">
                    <a href="{{ route('account.wishlist.index') }}" class="header-wishlist">
                        <div class="icon-wrap">
                            <i class="lar la-heart"></i>
                            <div class="count" v-text="wishlistCount"></div>
                        </div>
                    </a>

                    <div class="header-cart">
                        <div class="icon-wrap">
                            <i class="las la-cart-arrow-down"></i>
                            <div class="count" v-text="cart.quantity"></div>
                        </div>
                    </div>

                    @auth
                        <a class="header-auth" href="{{ route('account.dashboard.index') }}">
                            <div class="icon-wrap">
                                <i class="las la-user" style="font-size: 45px;"></i>
                            </div>
                        </a>
                    @else
                        <a href="{{ route('login') }}" class="header-login">
                            <div class="icon-wrap">
                                {{ trans('storefront::layout.login') }}
                            </div>
                        </a>
                    @endauth

                </div>
            </div>
        </div>
    </div>
</header>
