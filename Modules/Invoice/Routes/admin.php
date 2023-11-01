<?php

use Illuminate\Support\Facades\Route; 
  

Route::get('invoice', [
    'as' => 'admin.invoice.index',
    'uses' => 'InvoiceController@index',
    'middleware' => 'can:admin.invoice.index',
]);

Route::post('invoice/products', [
    'as' => 'admin.invoice.products',
    'uses' => 'InvoiceController@getProductByID',
    'middleware' => 'can:admin.invoice.index',
]);

Route::post('invoice/create', [
    'as' => 'admin.invoice.create',
    'uses' => 'InvoiceController@create',
    'middleware' => 'can:admin.invoice.index',
]);
 
Route::get('invoice/{order}/edit', [
    'as' => 'admin.invoice.edit',
    'uses' => 'InvoiceController@edit',
    'middleware' => 'can:admin.invoice.edit',
]); 

 
Route::post('invoice/update', [
    'as' => 'admin.invoice.update',
    'uses' => 'InvoiceController@update',
    'middleware' => 'can:admin.invoice.edit',
]); 