<?php

namespace Modules\Cart\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

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
        return $next($request);
    }
}
