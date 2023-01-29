<!-- Add -->
<div class="modal fade" id="add">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Patient | New</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="bank-patient-add" enctype="multipart/form-data">
                    @csrf
                    <div class="card" style="width:100%;">
                        <div class="card-header bg-info">
                            <h3 class="card-title">Personal Information</h3>
                        </div>
                        <div class="card-body">

                            <p>Select a photo of the patient requesting.</p>

                            <div class="form-group">
                                <label for="photo" class="col-sm-3 control-label">Photo</label>

                                <div class="col-xs-3">
                                    <img class="box-style" src="images/patients/patient.jpg" id="patient_photo"
                                        width="170px" height="150px">

                                </div>
                                <input type="file" placeholder="" class="file-chooser"
                                    onchange="document.getElementById('patient_photo').src = window.URL.createObjectURL(this.files[0])"
                                    id="photo" name="photo" alt="Employee Photo" required>
                            </div>

                            <br>
                            <p>Fill patient's personal information below.</p>
                            <div class="row">

                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-12 control-label">Last Name</label>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="lastname" name="lastname"
                                                placeholder="Ex: Mendoza"
                                                oninput="this.value = this.value.replace(/[^A-Z a-z ]/g, '');">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="firstname" class="col-sm-12 control-label">First Name</label>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="firstname" name="firstname"
                                                placeholder="Ex: John"
                                                oninput="this.value = this.value.replace(/[^A-Z a-z ]/g, '');">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="middlename" class="col-sm-12 control-label">M.I.</label>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="middlename" name="middlename"
                                                placeholder="Ex: Lopez"
                                                oninput="this.value = this.value.replace(/[^A-Z a-z ]/g, '');">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <br>
                            <p>Enter patient's current address.</p>
                            <div class="row">

                                <div class="col-sm-10">
                                    <div class="form-group">
                                        <label for="address" class="col-sm-12 control-label">Address</label>
                                        <div class="col-xs-12">
                                            <textarea rows="3" class="form-control" id="address" name="address"
                                                placeholder="Ex: 136 Sitio Crossing, Barangay Ilaya Panaon, Unisan, Quezon 4305"></textarea>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <br>
                            <p>Enter patient's contacts number or email.</p>
                            <div class="row">

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="contact" class="col-sm-12 control-label">Contact No.</label>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="contact" name="contact"
                                                placeholder="Ex: 09634905586"
                                                oninput="this.value = this.value.replace(/[^0-9 ]/g, '');">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="email" class="col-sm-12 control-label">Email Address</label>
                                        <div class="col-xs-12">
                                            <input type="email" class="form-control" id="email" name="email"
                                                placeholder="Ex: john@gmail.com">
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <br>
                            <p>Enter patient's blood type.</p>
                            <div class="row">

                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="type" class="col-sm-12 control-label">Blood Type</label>
                                        <div class="col-sm-2">
                                            <select class="form-control" style="font-color:black" id="type"
                                                name="type" required>
                                                <option value="" selected>- Select -</option>
                                                @foreach ($types as $type)
                                                    <option value="{{ $type['id'] }}">{{ $type['symbol'] }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>

                            </div>



                        </div>
                    </div>

                    <div class="card" style="width:100%;">
                        <div class="card-header bg-navy">
                            <h3 class="card-title">Guardian Information</h3>
                        </div>
                        <div class="card-body">

                            <p>Type in the full name of the patient's guardian.</p>
                            <div class="row">

                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="glastname" class="col-sm-12 control-label">Last Name</label>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="glastname"
                                                name="glastname" placeholder="Ex: Mendoza"
                                                oninput="this.value = this.value.replace(/[^A-Z a-z ]/g, '');">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="form-group">
                                        <label for="gfirstname" class="col-sm-12 control-label">First Name</label>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="gfirstname"
                                                name="gfirstname" placeholder="Ex: John"
                                                oninput="this.value = this.value.replace(/[^A-Z a-z ]/g, '');">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <label for="gmiddlename" class="col-sm-12 control-label">M.I.</label>
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="gmiddlename"
                                                name="gmiddlename" placeholder="Ex: Lopez"
                                                oninput="this.value = this.value.replace(/[^A-Z a-z ]/g, '');">
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <br>
                            <p>Type in the relationship of patient and the guardian.</p>
                            <div class="row">

                                <div class="col-sm-10">
                                    <div class="form-group">
                                        <label for="grelationship"
                                            class="col-sm-12 control-label">Relationship</label>
                                        <div class="col-xs-12">

                                            <input type="text" class="form-control" id="grelationship"
                                                placeholder="Ex: Father, Mother, Aunt, Uncle etc."
                                                name="grelationship"
                                                oninput="this.value = this.value.replace(/[^A-Z a-z ]/g, '');">
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<!-- Add -->


<!-- Release-->
<div class="modal fade" id="release">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Patient | Release Blood</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="patient-release" enctype="multipart/form-data">
                    @csrf

                    <!-- we are adding the accordion ID so Bootstrap's collapse plugin detects it -->
                    <div id="accordion">
                        <div class="card card-info">
                            <div class="card-header">
                                <h4 class="card-title w-100">
                                    <a class="d-block w-100" data-toggle="collapse" href="#collapseOne">
                                        1. Select blood bag from inventory.
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-3 control-label">Inventory</label>
                                        <p>Dispose of bags that are nearing their expiration date.</p>
                                        <div class="col-xs-12">

                                            <input type="hidden" id="selected_type_id" name="selected_type_id" />
                                            <input type="hidden" id="selected_inventory_id" name="inventory_id" />
                                            <input type="hidden" id="selected_patient_id" name="patient_id" />
                                            <table id="example2" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Donor No.</th>
                                                        <th>Donor Name</th>
                                                        <th>Blood Type</th>
                                                        <th>Status</th>
                                                        <th>Expiration</th>
                                                        <th>Tools</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($inventories as $inventory)
                                                        <tr>
                                                            <td>{{ $inventory['inventory_id'] }}</td>
                                                            <td>{{ $inventory['donor_id'] }}</td>
                                                            <td>{{ $inventory['donor_name'] }}</td>
                                                            <td>{{ $inventory['blood_type'] }}</td>
                                                            <td>
                                                                <?php if($inventory['status'] == 0){ ?>
                                                                <center><span class="badge bg-green">AVAILABLE</span>
                                                                </center>
                                                                <?php } else {?>
                                                                <center><span
                                                                        class="badge bg-yellow">TRANSFFERED</span>
                                                                </center>
                                                                <?php } ?>
                                                            </td>
                                                            <td>{{ date('M d, Y', strtotime($inventory['expiration_date'])) }}
                                                            </td>
                                                            <td>
                                                                <button type="button"
                                                                    class="btn btn-outline-success btn-sm"
                                                                    id="button_select_donor"
                                                                    value="{{ $inventory }}"
                                                                    onclick="setValue(this.value)">Select</button>

                                                            </td>

                                                        </tr>
                                                    @endforeach


                                                </tbody>
                                                <tfoot>

                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="card card-success">
                            <div class="card-header">
                                <h4 class="card-title w-100">
                                    <a class="d-block w-100" data-toggle="collapse" href="#collapseTwo">
                                        2. Review patient's blood bag. (For Release)
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="collapse" data-parent="#accordion">

                                <div class="row">

                                    <div class="col-sm-6">
                                        <div class="card">
                                            <div class="card-header">
                                            </div>
                                            <div class="card-body">

                                                <p>This is the donor's name.</p>
                                                <div class="row">

                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <label for="donor_name"
                                                                class="col-sm-12 control-label">Full Name</label>
                                                            <div class="col-xs-12">
                                                                <input type="text" class="form-control"
                                                                    id="donor_name" name="donor_name"
                                                                    placeholder="Ex: Mendoza, Sajed Lopez" disabled="true">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <br />
                                                <p>This is the donor's blood type.</p>
                                                <div class="row">

                                                    <div class="col-sm-5">
                                                        <div class="form-group">
                                                            <label for="donor_type"
                                                                class="col-sm-12 control-label">Blood Type</label>
                                                            <div class="col-xs-12">
                                                                <input type="text" class="form-control"
                                                                    id="donor_type" name="donor_type"
                                                                    placeholder="Ex: A+" disabled="true">
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>

                                                <br />
                                                <p>This is blood's expiration.</p>
                                                <div class="row">

                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <label for="inventory_expiration"
                                                                class="col-sm-12 control-label">Expirate Date</label>
                                                            <div class="col-xs-12">
                                                                <input type="text" class="form-control"
                                                                    id="inventory_expiration" name="inventory_expiration"
                                                                    placeholder="Ex: 05/07/2023" disabled="true">

                                                            </div>
                                                        </div>
                                                    </div>



                                                </div>



                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="card">
                                            <div class="card-header">
                                            </div>
                                            <div class="card-body">

                                                <p>This is the patient's name.</p>
                                                <div class="row">

                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <label for="patient_name"
                                                                class="col-sm-12 control-label">Full Name</label>
                                                            <div class="col-xs-12">
                                                                <input type="text" class="form-control"
                                                                    id="patient_name" name="patient_name"
                                                                    placeholder="Ex: Mendoza, Sajed Lopez" disabled="true">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <br />
                                                <p>This is the patient's blood type.</p>
                                                <div class="row">

                                                    <div class="col-sm-5">
                                                        <div class="form-group">
                                                            <label for="patient_type"
                                                                class="col-sm-12 control-label">Blood Type</label>
                                                            <div class="col-xs-12">
                                                                <input type="text" class="form-control"
                                                                    id="patient_type" name="patient_type"
                                                                    placeholder="Ex: A+" disabled="true">
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>




                            </div>
                        </div>

                    </div>

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
