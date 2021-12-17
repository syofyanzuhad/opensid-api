<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call('UsersTableSeeder');
        // seed new user with closure
        \App\Models\User::class::create([
                'name' => 'Admin',
                'username' => 'admin',
                'password' => Hash::make('secret'),
            ]);
    }
}
