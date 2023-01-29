<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Bank;
use Intervention\Image\Facades\Image;

class BanksController extends Controller
{
    function fetchBanks()
    {

        $banks = Bank::all();
        return view('banks', ['banks' => $banks]);
    }

    // SAVE BANK
    function saveBank(Request $req)
    {

        $validated = $req->validate([
            'name' => 'required|unique:banks|max:255',
            'logo' => 'required|image|max:2048',
            'email' => 'required',
            'contact' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
        ]);

        if (!$validated) {
            return redirect('banks');
        }

        $logo = $req->file('logo');
        $logo_name = uniqid() . '.' . $logo->getClientOriginalExtension();

        $thumbnail = Image::make($logo)->save(public_path('images/banks/' . $logo_name));

        $address_request_url = "https://maps.googleapis.com/maps/api/geocode/json?latlng={$req->latitude},{$req->longitude}&key=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs";
        $address_request_response = file_get_contents($address_request_url);
        $address_request_json = json_decode($address_request_response, true);
        $bank_address = $address_request_json['results'][0]['formatted_address'];


        $bank = new Bank;
        $bank->name = $req->name;
        $bank->logo = $logo_name;
        $bank->email = $req->email;
        $bank->contact = $req->contact;
        $bank->address = $bank_address;
        $bank->latitude = $req->latitude;
        $bank->longitude = $req->longitude;
        $bank->status = "1";
        $bank->administrator_id = session('administrator');
        $bank->save();


        
        return redirect()->back()->with('success', 'Blood Bank has been saved successfully!');
    }
    // SAVE BANK


    // DELETE BANK
    function deleteBank(Request $req)
    {
        $validated = $req->validate([
            'id' => 'required',
        ]);

        if (!$validated) {
            return redirect('banks');
        }

        $bank = Bank::find($req->id);
        $bank->delete();

        return redirect()->back()->with('success', 'Blood Bank has been deleted successfully!');
    }
    // DELETE BANK


    // UPDATE BANK
    function updateBank(Request $req)
    {

        $validated = $req->validate([
            'name' => 'required|max:255',
            'email' => 'required',
            'contact' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
            'status' => 'required',
        ]);

        if (!$validated) {
            return redirect('banks');
        }

        $address_request_url = "https://maps.googleapis.com/maps/api/geocode/json?latlng={$req->latitude},{$req->longitude}&key=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs";
        $address_request_response = file_get_contents($address_request_url);
        $address_request_json = json_decode($address_request_response, true);
        $bank_address = $address_request_json['results'][0]['formatted_address'];

        $bank = Bank::find($req->id);
        $bank->name = $req->name;
        $bank->email = $req->email;
        $bank->contact = $req->contact;
        $bank->address = $bank_address;
        $bank->latitude = $req->latitude;
        $bank->longitude = $req->longitude;
        $bank->status = $req->status;
        $bank->administrator_id = session('administrator');
        $bank->save();

        return redirect()->back()->with('success', 'Blood Bank has been updated successfully!');
    }
    // UPDATE BANK

}
