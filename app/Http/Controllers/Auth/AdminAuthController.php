<?php

namespace App\Http\Controllers\Auth;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AdminAuthController extends Controller
{
    
    public function loginStudent(Request $request)
    {
        $credentials = $request->only('email', 'password');
    
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            if ($user->role === 'student') {
                // Eager load the 'student' relationship to ensure 'student' is available
                $user->load('student');
                
                $token = $user->createToken('Student')->accessToken;
                return response()->json([
                    'token' => $token,
                    'user' => [
                        'name' => $user->name,
                        'id' => $user->id,
                        'phone' => $user->student->phone,
                        'school_id' => $user->student->school_id,
                    ],
                    'role' => 'student',
                ], 200);
            } elseif ($user->role === 'admin') {
                $token = $user->createToken('Administrator')->accessToken;
                return response()->json([
                    'token' => $token,
                    'user' => [
                        'name' => $user->name,
                        'id' => $user->id,
                    ],
                    'role' => 'admin',
                ], 200);
            }
        }
    
        return response()->json(['message' => 'Unauthorized'], 401);
    }
    
    

    
    
public function loginAdministrator(Request $request)
{
    // Validate the request data

    $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {
        $user = Auth::user();
        if ($user->role === 'admin') {
            $token = $user->createToken('Administrator')->accessToken;

            // Retrieve the role from the user model
            $role = $user->role;

            return response()->json(['token' => $token, 'role' => $role], 200);
        }
    }

    return response()->json(['message' => 'Unauthorized'], 401);
}
}
