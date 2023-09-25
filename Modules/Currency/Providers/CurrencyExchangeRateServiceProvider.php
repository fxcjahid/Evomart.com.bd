<?php

namespace Modules\Currency\Providers;

use Illuminate\Support\ServiceProvider;
use Modules\Currency\Services\CurrencyRateExchanger;
use Swap\Builder;

class CurrencyExchangeRateServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (!config('app.installed')) {
            return;
        }

        $this->setupCurrencyRateExchangeService();

        $this->app->singleton(CurrencyRateExchanger::class, function () {
            $service = setting('currency_rate_exchange_service', 'array');
            $options = config("evomart.modules.currency.config.services.{$service}");

            $swap = (new Builder)->add($service, $options)->build();

            return new CurrencyRateExchanger($swap);
        });
    }

    /**
     * Setup currency rate exchange service.
     *
     * @return void
     */
    private function setupCurrencyRateExchangeService()
    {
        config([
            'evomart.modules.currency.config.services.fixer.access_key'           => setting('fixer_access_key'),
            'evomart.modules.currency.config.services.forge.api_key'              => setting('forge_api_key'),
            'evomart.modules.currency.config.services.currency_data_feed.api_key' => setting('currency_data_feed_api_key'),
        ]);
    }
}
