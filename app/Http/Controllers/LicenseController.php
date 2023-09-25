<?php

namespace Evomart\Http\Controllers;

use Evomart\License;
use Illuminate\Routing\Controller;
use Evomart\Http\Middleware\RedirectIfShouldNotCreateLicense;

class LicenseController extends Controller
{
    public function __construct()
    {
        $this->middleware(RedirectIfShouldNotCreateLicense::class);
    }

    public function create()
    {
        return view('license.create');
    }

    public function store(License $license)
    {
        request()->validate([
            'purchase_code' => 'required',
        ], [
            'required' => 'The purchase code field is required.',
        ]);

        $license->activate(request('purchase_code'));

        return redirect()->intended();
    }
}
