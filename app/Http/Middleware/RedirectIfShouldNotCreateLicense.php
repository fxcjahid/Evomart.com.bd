<?php

namespace Evomart\Http\Middleware;

use Closure;
use Evomart\License;

class RedirectIfShouldNotCreateLicense
{
    private $license;

    public function __construct(License $license)
    {
        $this->license = $license;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
		return redirect()->intended('/admin');
    }
}
