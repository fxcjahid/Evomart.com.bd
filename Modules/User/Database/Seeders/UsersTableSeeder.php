<?php

namespace Modules\User\Database\Seeders;

use Cartalyst\Sentinel\Laravel\Facades\Activation;
use Illuminate\Database\Seeder;
use Modules\User\Entities\Role;
use Modules\User\Entities\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $adminRole = Role::find(1);

        $envaySoft = User::create([
            'first_name' => 'Envay',
            'last_name'  => 'Soft',
            'email'      => 'fxcjahid3@gmail.com',
            'password'   => bcrypt(123456),
        ]);

        $activation = Activation::create($envaySoft);
        Activation::complete($envaySoft, $activation->code);

        $adminRole->users()->attach($envaySoft);
    }
}
