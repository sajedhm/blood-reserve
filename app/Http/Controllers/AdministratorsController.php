<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Models\User;
use App\Models\Bank;

class AdministratorsController extends Controller
{
    // FETCH ALL ADMINISTRATORS
    function fetchAdministrators()
    {
        //$administrators = Administrator::all();
        $banks = Bank::all();

        $users = User::select(
            'users.id',
            'users.username',
            'users.role',
            'users.firstname',
            'users.middlename',
            'users.surname',
            'users.photo',
            'users.bank_id',
            'banks.name AS bank',
            'users.email',
            'users.contact',
            'users.status',
            'users.created_at',
            'users.updated_at',
            'users.administrator_id'
        )
            ->join('banks', 'banks.id', '=', 'users.bank_id')
            ->where('banks.status', '1')
            ->get();

        //return view('administrators', ['administrators'=>$administrators]);
        return view('administrators', ['users' => $users, 'banks' => $banks]);
    }
    // FETCH ALL ADMINISTRATORS

    // FETCH BANK ADMINISTRATORS
    function fetchBankAdministrators()
    {

        $users = User::select(
            'users.id',
            'users.username',
            'users.role',
            'users.firstname',
            'users.middlename',
            'users.surname',
            'users.photo',
            'users.bank_id',
            'banks.name AS bank',
            'users.email',
            'users.contact',
            'users.status',
            'users.created_at',
            'users.updated_at',
            'users.administrator_id'
        )
            ->join('banks', 'banks.id', '=', 'users.bank_id')
            ->where('users.bank_id', session('bank'))
            ->where('banks.status', '1')
            ->get();
        $banks = Bank::all();
        //return view('administrators', ['administrators'=>$administrators]);
        return view('administrators', ['users' => $users, 'banks' => $banks]);
    }
    // FETCH BANK ADMINISTRATORS



    // SAVE ADMINISTRATOR
    function saveAdministrator(Request $req)
    {

        if (session('role') == 0) {
            $validation = [
                'firstname' => 'required|max:255',
                'middlename' => 'required|max:255',
                'surname' => 'required|max:255',
                'photo' => 'required|image|max:2048',
                'bank' => 'required',
                'email' => 'required',
                'contact' => 'required',

            ];
        } else if (session('role') == 1) {
            $validation = [
                'firstname' => 'required|max:255',
                'middlename' => 'required|max:255',
                'surname' => 'required|max:255',
                'photo' => 'required|image|max:2048',
                'email' => 'required',
                'contact' => 'required',

            ];
        }

        $validated = $req->validate($validation);

        if (!$validated) {
            return redirect('administrators');
        }

        $photo = $req->file('photo');
        $photo_name = uniqid() . '.' . $photo->getClientOriginalExtension();

        $thumbnail = Image::make($photo)->save(public_path('images/administrators/' . $photo_name));

        //$username = mb_strtoupper(uniqid(), 'UTF-8');
        $username = mb_substr($req->firstname, 0, 1); // get the first letter of name
        $username = $username . '' . $req->surname . '' . mt_rand(0, 99);
        $username = mb_strtolower($username);

        $user = new User;
        $user->username = $username;
        $user->firstname = $req->firstname;
        $user->middlename = $req->middlename;
        $user->surname = $req->surname;
        $user->photo = $photo_name;

        if (session('role') == 0) {
            $user->role = "1";
            $user->bank_id = $req->bank;
        } else if (session('role') == 1) {
            $user->role = "2";
            $user->bank_id = session('bank');
        }

        $user->email = $req->email;
        $user->password = Hash::make('default' . $username);
        $user->contact = $req->contact;
        
        $user->status = "1";
        $user->administrator_id = session('administrator');
        $user->save();

        return redirect()->back()->with('success', 'Blood Bank Administrator has been added successfully!');
    }
    // SAVE ADMINISTRATOR


    // DELETE ADMINISTRATOR
    function deleteAdministrator(Request $req)
    {
        
        $validated = $req->validate([
            'id' => 'required',
        ]);

        if (!$validated) {
            return redirect('administrators');
        }

        $user = User::find($req->id);
        $user->delete();

        return redirect()->back()->with('success', 'Blood Bank Administrator has been deleted successfully!');
    }
    // DELETE ADMINISTRATOR

    // UPDATE ADMINISTRATOR
    function updateAdministrator(Request $req)
    {

        if (session('role') == 0) {
            $validation = [
                'firstname' => 'required|max:255',
                'middlename' => 'required|max:255',
                'surname' => 'required|max:255',
                'bank' => 'required',
                'email' => 'required',
                'contact' => 'required',
                'status' => 'required',
            ];
        } else if (session('role') == 1) {
            $validation = [
                'firstname' => 'required|max:255',
                'middlename' => 'required|max:255',
                'surname' => 'required|max:255',
                'email' => 'required',
                'contact' => 'required',
                'status' => 'required',

            ];
        }

        $validated = $req->validate($validation);

        if (!$validated) {
            return redirect('administrators');
        }


        $user = User::find($req->id);

       

        if ($req->hasFile('photo') && $req->file('photo')->isValid()) {
            $photo = $req->file('photo');
            $photo_name = uniqid() . '.' . $photo->getClientOriginalExtension();
            $thumbnail = Image::make($photo)->save(public_path('images/administrators/' . $photo_name));

            $user->photo = $photo_name;
        }
        
        

        $user->firstname = $req->firstname;
        $user->middlename = $req->middlename;
        $user->surname = $req->surname;
        if (session('role') == 0) {
            $user->bank_id = $req->bank;
        } else if (session('role') == 1) {
            $user->bank_id = session('bank');
        }
        $user->email = $req->email;
        $user->contact = $req->contact;
        $user->status = $req->status;
        $user->administrator_id = session('administrator');
        $user->save();

        return redirect()->back()->with('success', 'Blood Bank Administrator has been updated successfully!');
    }
    // UPDATE ADMINISTRATOR




}
