<?php

namespace Evomart\Http\Controllers;

use Exception;
use Evomart\Http\Middleware\RedirectIfInstalled;
use Evomart\Http\Requests\InstallRequest;
use Evomart\Install\AdminAccount;
use Evomart\Install\App;
use Evomart\Install\Database;
use Evomart\Install\Requirement;
use Evomart\Install\Store;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Artisan;
use Jackiedo\DotenvEditor\Facades\DotenvEditor;

class InstallController extends Controller
{
    public function __construct()
    {
        $this->middleware(RedirectIfInstalled::class);
    }

    public function preInstallation(Requirement $requirement)
    {
        return view('install.pre_installation', compact('requirement'));
    }

    public function getConfiguration(Requirement $requirement)
    {
        if (!$requirement->satisfied()) {
            return redirect()->route('install.pre_installation');
        }

        return view('install.configuration', compact('requirement'));
    }

    public function postConfiguration(
        InstallRequest $request,
        Database $database,
        AdminAccount $admin,
        Store $store,
        App $app
    ) {

        try {

            set_time_limit(0);

            $database->setup($request->db);
            $admin->setup($request->admin);
            $store->setup($request->store);
            $app->setup();
        } catch (Exception $e) {
            return back()->withInput()
                ->with('error', $e->getMessage());
        }

        return redirect('install/complete');
    }

    public function complete()
    {

        try {
            ini_set('memory_limit', '3000M');
            ini_set('max_execution_time', '0');

            Artisan::call('migrate:fresh');
        } catch (Exception $e) {
            echo $e;
        }
        dd(Artisan::output());

        if (config('app.installed')) {
            return redirect()->route('home');
        }

        DotenvEditor::setKey('APP_INSTALLED', 'true')->save();

        return view('install.complete');
    }
}
