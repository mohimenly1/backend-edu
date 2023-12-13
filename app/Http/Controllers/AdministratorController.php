<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use App\Models\User;
use Illuminate\Http\Request;

class AdministratorController extends Controller
{
    public function create(Request $request)
{
    // Validate the request data
    $request->validate([
        'name' => 'required|string',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|string',
    ]);

    // Create a new user with the role 'admin'
    $user = new User();
    $user->name = $request->input('name');
    $user->email = $request->input('email');
    $user->password = bcrypt($request->input('password'));
    $user->role = 'admin';
    $user->save();

    // Create a new administrator associated with the user
    $administrator = new Administrator();
    $administrator->name = $request->input('name');
    $administrator->user_id = $user->id; // Associate the user record with the administrator
    $administrator->save();

    return response()->json(['message' => 'Administrator created successfully'], 201);
}
}
