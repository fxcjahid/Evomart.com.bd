<?php

use Illuminate\Support\Facades\Route;

Route::get('install/pre-installation', 'InstallController@preInstallation')->name('install.pre_installation');
Route::get('install/configuration', 'InstallController@getConfiguration')->name('install.configuration.show');
Route::post('install/configuration', 'InstallController@postConfiguration')->name('install.configuration.post');
Route::get('install/complete', 'InstallController@complete')->name('install.complete');

Route::get('license', 'LicenseController@create')->name('license.create');
Route::post('license', 'LicenseController@store')->name('license.store');

Route::post('install/run', function () {

    try {
        ini_set('memory_limit', '3000M');
        ini_set('max_execution_time', '0');

        Artisan::call('migrate:fresh');
    } catch (Exception $e) {
        echo $e;
    }
    dd(Artisan::output());

});
