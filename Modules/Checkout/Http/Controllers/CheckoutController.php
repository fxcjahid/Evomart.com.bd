<?php

namespace Modules\Checkout\Http\Controllers;

use Exception;
use Illuminate\Routing\Controller;
use Modules\Address\Entities\DefaultAddress;
use Modules\Cart\Facades\Cart;
use Modules\Cart\Http\Middleware\CheckCartStock;
use Modules\Cart\Http\Middleware\CheckCouponUsageLimit;
use Modules\Cart\Http\Middleware\RedirectIfCartIsEmpty;
use Modules\Checkout\Services\OrderService;
use Modules\Order\Http\Requests\StoreOrderGuestRequest;
use Modules\Order\Http\Requests\StoreOrderRequest;
use Modules\Page\Entities\Page;
use Modules\Payment\Facades\Gateway;
use Modules\Support\Country;
use Modules\User\Services\CustomerService;

class CheckoutController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware([
            RedirectIfCartIsEmpty::class,
            CheckCartStock::class,
            CheckCouponUsageLimit::class,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        Gateway::all();
        return view('public.checkout.create', [
            'cart'           => Cart::instance(),
            'countries'      => Country::supported(),
            'gateways'       => Gateway::all(),
            'defaultAddress' => auth()->user()->defaultAddress ?? new DefaultAddress,
            'addresses'      => $this->getAddresses(),
            'termsPageURL'   => Page::urlForPage(setting('storefront_terms_page')),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function guest() {

        if (!auth()->guest()) {
            return redirect()->route('checkout.create');
        }

        Gateway::all();
        return view('public.checkout.guest', [
            'cart'           => Cart::instance(),
            'countries'      => Country::supported(),
            'gateways'       => Gateway::all(),
            'defaultAddress' => auth()->user()->defaultAddress ?? new DefaultAddress,
            'addresses'      => $this->getAddresses(),
            'termsPageURL'   => Page::urlForPage(setting('storefront_terms_page')),
        ]);
    }

    /**
     * Get addresses for the logged in user.
     *
     * @return \Illuminate\Support\Collection
     */
    private function getAddresses() {
        if (auth()->guest()) {
            return collect();
        }

        return auth()->user()->addresses->keyBy('id');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Modules\Order\Http\Requests\StoreOrderRequest $request
     * @param \Modules\User\Services\CustomerService $customerService
     * @param \Modules\Checkout\Services\OrderService $orderService
     * @return \Illuminate\Http\Response
     */
    public function store(StoreOrderRequest $request, CustomerService $customerService, OrderService $orderService) {
        if (auth()->guest() && $request->create_an_account) {
            $customerService->register($request)->login();
        }

        $order = $orderService->create($request);

        $gateway = Gateway::get($request->payment_method);

        try {
            $response = $gateway->purchase($order, $request);
        } catch (Exception $e) {
            $orderService->delete($order);

            return response()->json([
                'message' => $e->getMessage(),
            ], 403);
        }

        return response()->json($response);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Modules\Order\Http\Requests\StoreOrderGuestRequest $request
     * @param \Modules\User\Services\CustomerService $customerService
     * @param \Modules\Checkout\Services\OrderService $orderService
     * @return \Illuminate\Http\Response
     */
    public function guestStore(StoreOrderGuestRequest $request, CustomerService $customerService, OrderService $orderService) {

        if (!auth()->guest()) {
            redirect()->route('checkout.create');
        }

        $order = $orderService->create($request);

        $gateway = Gateway::get($request->payment_method);

        try {
            $response = $gateway->purchase($order, $request);
        } catch (Exception $e) {
            $orderService->delete($order);

            return response()->json([
                'message' => $e->getMessage(),
            ], 403);
        }

        return response()->json($response);
    }
}
