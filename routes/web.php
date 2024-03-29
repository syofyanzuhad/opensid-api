<?php

use Laravel\Lumen\Http\Request;
use Illuminate\Support\Facades\Auth;

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'v1'], function () use ($router) {
    $router->post('/register', 'AuthController@register');
    $router->post('/login', 'AuthController@login');

    $router->group(['middleware' => 'auth'], function () use ($router) { 
        $router->put('/refresh', 'AuthController@refresh');
        $router->post('/logout', 'AuthController@logout');

        $router->get('penduduk', 'PendudukController@index');
        $router->get('penduduk/{id}', 'PendudukController@show');
        $router->get('keluarga', 'KeluargaController@index');
        $router->get('keluarga/{id}', 'KeluargaController@show');
    });
});