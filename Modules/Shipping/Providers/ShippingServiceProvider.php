<?php

namespace Modules\Shipping\Providers;

use Illuminate\Support\ServiceProvider;
use Modules\Shipping\Facades\ShippingMethod;
use Modules\Shipping\Method;

class ShippingServiceProvider extends ServiceProvider {
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot() {
        if (!config('app.installed')) {
            return;
        }

        $this->registerFreeShipping();
        $this->registerInsdieDhakaShipping();
        $this->registerOutsideDhakaShipping();

    }

    private function registerFreeShipping() {
        if (!setting('free_shipping_enabled')) {
            return;
        }

        ShippingMethod::register('free_shipping', function () {
            return new Method('free_shipping', setting('free_shipping_label'), 0);
        });
    }

    private function registerInsdieDhakaShipping() {
        if (!setting('inside_dhaka_enabled')) {
            return;
        }

        ShippingMethod::register('inside_dhaka', function () {
            return new Method('inside_dhaka',
                setting('inside_dhaka_label'),
                setting('inside_dhaka_cost')
            );
        });
    }

    private function registerOutsideDhakaShipping() {
        if (!setting('outside_dhaka_enabled')) {
            return;
        }

        ShippingMethod::register('outside_dhaka', function () {
            return new Method('outside_dhaka',
                setting('outside_dhaka_label'),
                setting('outside_dhaka_cost')
            );
        });
    }

    private function registerLocalPickup() {
        if (!setting('local_pickup_enabled')) {
            return;
        }

        ShippingMethod::register('local_pickup', function () {
            return new Method('local_pickup', setting('local_pickup_label'), setting('local_pickup_cost'));
        });
    }

    private function registerFlatRate() {
        if (!setting('flat_rate_enabled')) {
            return;
        }

        ShippingMethod::register('flat_rate', function () {
            return new Method('flat_rate', setting('flat_rate_label'), setting('flat_rate_cost'));
        });
    }
}
