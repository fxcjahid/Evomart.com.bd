<?php

use Illuminate\Support\Facades\Route;

Route::get('checkout', 'CheckoutController@create')->name('checkout.create');
Route::post('checkout', 'CheckoutController@store')->name('checkout.store');

Route::get('checkout/guest', 'CheckoutController@guest')->name('checkout.guest');
Route::post('checkout/guest', 'CheckoutController@guestStore')->name('checkout.guest.store');
Route::post('checkout/offers', 'CheckoutController@fromLandingPage')->name('checkout.fromLandingPage');

Route::get('checkout/{orderId}/complete', 'CheckoutCompleteController@store')->name('checkout.complete.store');
Route::get('checkout/complete', 'CheckoutCompleteController@show')->name('checkout.complete.show');

Route::get('checkout/{orderId}/payment-canceled', 'PaymentCanceledController@store')->name('checkout.payment_canceled.store');
