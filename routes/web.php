<?php

use App\Http\Controllers\AdministratorsController;
use App\Http\Controllers\MunicipalitiesController;
use App\Http\Controllers\BanksController;
use App\Http\Controllers\DonorsController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\TypesController;
use App\Http\Controllers\InventoriesController;
use App\Http\Controllers\InventoryController;
use App\Http\Controllers\PatientController;

// Login Route
Route::get('/login', function () {
    if(session()->has('administrator')){
        return redirect('home');
    }
    return view('login');
});
Route::post("login", [LoginController::class, 'administratorLogin']);


// Login Route


// Logout Route
Route::get('/logout', function () {
    if(session()->has('administrator')){
        session()->pull('administrator');
    }
    return redirect('login');
});
// Logout Route


// Home Route
Route::view("home", 'home');
Route::get("home", [HomeController::class, 'fetchActiveMunicipalities']);
Route::get("/inventories-count", [HomeController::class, 'checkCount']);
Route::get("/maps-recommender/{id}", [HomeController::class, 'checkLocation']);
// Home Route


// Administrators Route
Route::view("administrators", 'administrators');
Route::get("administrators", [AdministratorsController::class, 'fetchAdministrators']);
Route::get("bank-administrators", [AdministratorsController::class, 'fetchBankAdministrators']);
Route::post("administrator-add", [AdministratorsController::class, 'saveAdministrator']);
Route::post("administrator-update", [AdministratorsController::class, 'updateAdministrator']);
Route::post("administrator-delete", [AdministratorsController::class, 'deleteAdministrator']);
// Administrators Route


// Municipalitites Route
Route::view("municipalities", 'municipalities');
Route::get("municipalities", [MunicipalitiesController::class, 'fetchMunicipalities']);
Route::post("municipality-add", [MunicipalitiesController::class, 'saveMunicipality']);
Route::post("municipality-update", [MunicipalitiesController::class, 'updateMunicipality']);
Route::post("municipality-delete", [MunicipalitiesController::class, 'deleteMunicipality']);
// Municipalitites Route


// Inventories Route
Route::view("inventories", 'inventories');
Route::get("inventories", [InventoriesController::class, 'fetchBanks']);
// Route::post("municipality-add", [MunicipalitiesController::class, 'saveMunicipality']);
// Route::post("municipality-update", [MunicipalitiesController::class, 'updateMunicipality']);
// Route::post("municipality-delete", [MunicipalitiesController::class, 'deleteMunicipality']);
// Inventories Route

// Inventory Route
Route::view("inventory", 'inventory');
Route::post("inventory-view", [InventoryController::class, 'fetchInventory']);
Route::get("bank-inventory-view", [InventoryController::class, 'fetchBankInventory']);
Route::post("bank-inventory-add", [InventoryController::class, 'saveBloodBag']);
Route::post("bank-inventory-edit", [InventoryController::class, 'updateBloodBag']);
// Route::post("municipality-update", [MunicipalitiesController::class, 'updateMunicipality']);
// Route::post("municipality-delete", [MunicipalitiesController::class, 'deleteMunicipality']);
// Inventory Route


// Banks Route
Route::view("banks", 'banks');
Route::get("banks", [BanksController::class, 'fetchBanks']);
Route::post("bank-add", [BanksController::class, 'saveBank']);
Route::post("bank-update", [BanksController::class, 'updateBank']);
Route::post("bank-delete", [BanksController::class, 'deleteBank']);
// Banks Route

// Patients Route
Route::view("patients", 'patients');
Route::get("patients", [PatientController::class, 'fetchPatients']);

Route::get("bank-patients", [PatientController::class, 'fetchBankPatients']);
Route::post("bank-patient-add", [PatientController::class, 'savePatient']);
Route::post("patient-update", [PatientController::class, 'updatePatients']);
Route::post("patient-delete", [PatientController::class, 'deletePatients']);
Route::post("patient-release", [PatientController::class, 'releaseBloodBag']);
// Patients Route


// Donors Route
Route::view("donors", 'donors');
Route::get("donors", [DonorsController::class, 'fetchDonors']);
Route::get("bank-donors", [DonorsController::class, 'fetchBankDonors']);
Route::post("donor-upload", [DonorsController::class, 'uploadDonors']);
Route::post("donor-export", [DonorsController::class, 'exportDonors']);
// Donors Route




// Blood Types Route
Route::view("types", 'types');

Route::get("types", [TypesController::class, 'fetchTypes']);
// Blood Types Route




