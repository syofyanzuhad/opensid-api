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
        \App\Models\User::firstOrCreate([
            'username' => 'admin',
        ],
        [
            'name' => 'Admin',
            'password' => Hash::make('secret'),
        ]);
    }
}
