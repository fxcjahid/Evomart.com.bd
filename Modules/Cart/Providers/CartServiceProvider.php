<?php

namespace Modules\Cart\Providers;

use Illuminate\Support\ServiceProvider;
use Modules\Cart\Cart;

class CartServiceProvider extends ServiceProvider
{
    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(Cart::class, function ($app) {
            return new Cart(
                $app['session'],
                $app['events'],
                'cart',
                session()->getId(),
                config('evomart.modules.cart.config')
            );
        });

        $this->app->alias(Cart::class, 'cart');
    }
}
