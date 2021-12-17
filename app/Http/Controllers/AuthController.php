<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    /**
     * Register a new user.
     *
     * @bodyParam name string required The name of the user. Example: barenglor
     * @bodyParam username username required The user username. Example: test@gmail.com
     * @bodyParam password string required Used to authenticate the user. Min: 6
     *
     * @return void
     */
    public function register(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        // Create new user
        try {
            User::create([
                'name' => $request->name,
                'username' => $request->username,
                'password' => app('hash')->make($request->password),
            ]);

            return $this->login($request);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @authenticated
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Get the authenticated User.
     *
     * @bodyParam username username required The user username. Example: test@gmail.com
     * @bodyParam password string required Used to authenticate the user.
     * 
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $this->validate($request, [
            'username' => 'required|string|max:255|exists:users,username',
            'password' => 'required|string',
        ]);

        $credentials = request(['username', 'password']);

        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }

    /**
     * Get the token array structure.
     *
     * @authenticated
     * @param string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => false
        ]);
    }
}