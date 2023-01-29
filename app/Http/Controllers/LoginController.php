<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    //
    function administratorLogin(Request $req)
    {

        $credentials = $req->only('username', 'password');

        if (Auth::attempt($credentials)) {
            

            $user = Auth::user();
            
            $userId = Auth::id();
            $userRole = $user->role;
            $userName  = $user->surname . ', ' . $user->firstname;
            $userBank = $user->bank_id;
            $userPhoto = 'images/administrators/' . $user->photo;
            

            $req->session()->put('administrator', $userId);
            $req->session()->put('role', $userRole);
            $req->session()->put('name', $userName);
            $req->session()->put('bank', $userBank);
            $req->session()->put('photo', $userPhoto);
            // Authentication passed...
            return redirect('home');
        }

        return redirect()->back()->withErrors([
            'message' => 'Invalid credentials. Please try again.',
        ])->withInput($req->only('username'));
    }


}
