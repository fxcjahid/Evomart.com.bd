<?php

namespace Modules\Compare\Providers;

use Illuminate\Support\ServiceProvider;
use Modules\Compare\Compare;

class CompareServiceProvider extends ServiceProvider
{
    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(Compare::class, function ($app) {
            return new Compare(
                $app['session'],
                $app['events'],
                'compare',
                session()->getId() . '_compare',
                config('evomart.modules.compare.config')
            );
        });

        $this->app->alias(Compare::class, 'compare');
    }
}
