<?php

namespace Modules\Product\Http\Controllers;

use Illuminate\Routing\Controller;
use Modules\Product\Entities\Product;
use Modules\Product\Events\ProductViewed;
use Modules\Product\Filters\ProductFilter;
use Modules\Product\Http\Middleware\SetProductSortOption;
use Modules\Review\Entities\Review;
use Modules\Cart\Facades\Cart;
use Modules\Payment\Facades\Gateway;
use Modules\Cart\Http\Middleware\TrackVisitedOffers;
use Modules\Address\Entities\DefaultAddress;

class ProductController extends Controller
{
    use ProductSearch;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(TrackVisitedOffers::class);
        $this->middleware(SetProductSortOption::class)->only('index');
    }

    /**
     * Display a listing of the resource.
     *
     * @param \Modules\Product\Entities\Product $model
     * @param \Modules\Product\Filters\ProductFilter $productFilter
     * @return \Illuminate\Http\Response
     */
    public function index(Product $model, ProductFilter $productFilter)
    {
        if (request()->expectsJson()) {
            return $this->searchProducts($model, $productFilter);
        }

        return view('public.products.index');
    }

    /**
     * Show the specified resource.
     *
     * @param string $slug
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $product         = Product::findBySlug($slug);
        $relatedProducts = $product->relatedProducts()->forCard()->get();
        $upSellProducts  = $product->upSellProducts()->forCard()->get();
        $related         = $product->relatedProductsByCategory($product)->forCard()->get();
        $review          = $this->getReviewData($product);

        if ($relatedProducts->isEmpty()) {
            $relatedProducts = $related;
        }

        event(new ProductViewed($product));

        return view('public.products.show', compact('product', 'relatedProducts', 'upSellProducts', 'review'));
    }


    /**
     * Show the specified resource.
     *
     * @param string $slug
     * @return \Illuminate\View\View
     */
    public function offerProduct($slug)
    {
        $product = Product::findBySlug($slug);
        $review  = $this->getReviewData($product);

        /** Create Add To Card Instance */
        Cart::clear();
        Cart::store(productId: $product->id, qty: 1, options: []);

        $cart           = Cart::instance();
        $gateways       = Gateway::all();
        $addresses      = $this->getAddresses();
        $defaultAddress = auth()->user()->defaultAddress ?? new DefaultAddress;

        event(new ProductViewed($product));

        return view('public.offer.show', compact('product', 'review', 'cart', 'gateways', 'addresses', 'defaultAddress'));
    }

    /**
     * Get addresses for the logged in user.
     *
     * @return \Illuminate\Support\Collection
     */
    private function getAddresses()
    {
        if (auth()->guest()) {
            return collect();
        }

        return auth()->user()->addresses->keyBy('id');
    }

    private function getReviewData(Product $product)
    {
        if (! setting('reviews_enabled')) {
            return;
        }

        return Review::countAndAvgRating($product);
    }
}
