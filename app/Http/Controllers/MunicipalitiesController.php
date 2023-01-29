<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Municipality;
use Intervention\Image\Facades\Image;

class MunicipalitiesController extends Controller
{

    // GET MUNICIPALITIES
    function fetchMunicipalities(){
        
        $data = Municipality::all();
        return view('municipalities', ['municipalities'=>$data]);

    }

    // GET MUNICIPALITIES


    // SAVE MUNICIPALITY
    function saveMunicipality(Request $req){
        
        $validated = $req->validate([
            'name' => 'required|unique:municipalities|max:255',
            'logo' => 'required|image|max:2048',
            'latitude' => 'required',
            'longitude' => 'required',
        ]);

        if(!$validated){
            return redirect('municipalities');
        }

        $logo = $req->file('logo');
        $logo_name = uniqid() . '.' . $logo->getClientOriginalExtension();

        $thumbnail = Image::make($logo)->save(public_path('images/municipalities/' . $logo_name));

        $address_request_url = "https://maps.googleapis.com/maps/api/geocode/json?latlng={$req->latitude},{$req->longitude}&key=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs";
        $address_request_response = file_get_contents($address_request_url);
        $address_request_json = json_decode($address_request_response, true);
        $municipality_address = $address_request_json['results'][0]['formatted_address'];

        $municipality = new Municipality;
        $municipality->name=$req->name;
        $municipality->logo=$logo_name;
        $municipality->address=$municipality_address;
        $municipality->latitude=$req->latitude;
        $municipality->longitude=$req->longitude;
        $municipality->status="1";
        $municipality->administrator_id=session('administrator');
        $municipality->save();
          
        //return redirect('municipalities');
        return redirect()->back()->with('success', 'Municipality has been added successfully!');
    }
    // SAVE MUNICIPALITY


    // DELETE MUNICIPALITY
    function deleteMunicipality(Request $req){
        $validated = $req->validate([
            'id' => 'required',
        ]);

        if(!$validated){
            return redirect('municipalities');
        }

        $data = Municipality::find($req->id);
        $data->delete();

        //return redirect('municipalities');
        return redirect()->back()->with('success', 'Municipality has been deleted successfully!');
    }
    // DELETE MUNICIPALITY


    // UPDATE MUNICIPALITY
    function updateMunicipality(Request $req){ 
        
        $validated = $req->validate([
            'name' => 'required|max:255',
            'latitude' => 'required',
            'longitude' => 'required',
            'status' => 'required',
        ]);

        if(!$validated){
            return redirect('municipalities');
        }

        $address_request_url = "https://maps.googleapis.com/maps/api/geocode/json?latlng={$req->latitude},{$req->longitude}&key=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs";
        $address_request_response = file_get_contents($address_request_url);
        $address_request_json = json_decode($address_request_response, true);
        $municipality_address = $address_request_json['results'][0]['formatted_address'];


        $data = Municipality::find($req->id);
        $data->name=$req->name;
        $data->address=$municipality_address;
        $data->latitude=$req->latitude;
        $data->longitude=$req->longitude;
        $data->status=$req->status;
        $data->administrator_id=session('administrator');  
        $data->save();
          
        //return redirect('municipalities');
        return redirect()->back()->with('success', 'Municipality has been updated successfully!');
    }
    // UPDATE MUNICIPALITY

    function convertToAddress($latitude, $longitude){

    }
}
