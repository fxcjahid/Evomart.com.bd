<?php

namespace Modules\Cart\Http\Middleware;


use Closure;
use Illuminate\Http\Request;
use Modules\Cart\Facades\Cart;

class TrackVisitedOffers
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Check if the request URL matches the specified pattern
        if ($request->is('offers/*')) {
            // Cart::clear();
        }

        return $next($request);
    }
}
