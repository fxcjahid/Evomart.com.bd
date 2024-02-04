<?php

namespace Evomart\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;

class speedup extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'speed:up';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Speed up application';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        /**
         * Clear all cache before
         */
        Artisan::call('route:clear');
        Artisan::call('config:clear');
        Artisan::call('view:clear');
        Artisan::call('cache:clear');
        Artisan::call('optimize:clear');

        Artisan::call('route:cache');
        Artisan::call('route:trans:cache');
        Artisan::call('config:cache');
        Artisan::call('view:cache');
        Artisan::call('optimize');
        $this->info('The command was successful!');
    }
}
