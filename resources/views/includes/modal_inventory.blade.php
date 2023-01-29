<!-- Transfer -->
<div class="modal fade" id="transfer">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Inventory | New</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="bank-inventory-add" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <div class="col-sm-12">
                        <!-- bs-stepper content -->
                        <div class="bs-stepper" id="stepper1">
                            <div class="bs-stepper-header">
                                <div class="step" data-target="#test-l-1">
                                    <button type="button" class="step-trigger">
                                        <span class="bs-stepper-circle"></span>
                                        <span class="bs-stepper-label">Choose</span>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#test-l-2">
                                    <button type="button" class="step-trigger">
                                        <span class="bs-stepper-circle"></span>
                                        <span class="bs-stepper-label">Fill Up</span>
                                    </button>
                                </div>
                                <div class="line"></div>
                                <div class="step" data-target="#test-l-3">
                                    <button type="button" class="step-trigger">
                                        <span class="bs-stepper-circle"></span>
                                        <span class="bs-stepper-label">Review & Save</span>
                                    </button>
                                </div>
                            </div>
                            <div class="bs-stepper-content">
                                <div id="test-l-1" class="content">
                                    <label>Choose a donor</label>
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Donor No.</th>
                                                <th>Donor Name</th>
                                                <th>Blood Type</th>
                                                <th>Status</th>
                                                <th>Tools</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($donors as $donor)
                                                <tr>

                                                    <td>{{ $donor['id'] }}</td>
                                                    <td>{{ $donor['donor_name'] }}</td>
                                                    <td>{{ $donor['blood_type'] }}</td>
                                                    <td>
                                                        <?php if($donor['status'] == 0){ ?>
                                                        <center><span class="badge bg-green">NEW</span>
                                                        </center>
                                                        <?php } else {?>
                                                        <center><span class="badge bg-yellow">TRANSFFERED</span>
                                                        </center>
                                                        <?php } ?>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-outline-success btn-sm"
                                                            id="button_select_donor" value="{{ $donor }}"
                                                            onclick="setValue(this.value)">Select</button>

                                                    </td>

                                                </tr>
                                            @endforeach


                                        </tbody>
                                        <tfoot>

                                        </tfoot>
                                    </table>

                                </div>
                                <div id="test-l-2" class="content">
                                    <label>Fill up blood bag information</label>
                                    
                                    <div class="form-group">
                                        <label>Donation Date</label>
                                        <div class="input-group date" id="datedonatedpicker"
                                            data-target-input="nearest">
                                            <input type="text"
                                                class="form-control form-control-lg datetimepicker-input"
                                                data-target="#datedonatedpicker" id="donated_at" name="donated_at" required="true" 
                                                oninput="this.value = this.value.replace(/[^0-9 / ]/g, '');" placeholder="MM/DD/YYYY" />
                                            <div class="input-group-append" data-target="#datedonatedpicker"
                                                data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Expiration Date</label>
                                        <div class="input-group date" id="expirationdatepicker"
                                            data-target-input="nearest">
                                            <input type="text"
                                                class="form-control form-control-lg datetimepicker-input"
                                                data-target="#expirationdatepicker" id="expired_at" name="expired_at" required="true" 
                                                oninput="this.value = this.value.replace(/[^0-9 / ]/g, '');" placeholder="MM/DD/YYYY" />
                                            <div class="input-group-append" data-target="#expirationdatepicker"
                                                data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-5">
                                        <a class="btn btn-outline-success btn-sm"
                                            onclick="stepper.previous()">Previous</a>
                                            
                                            <button type="button" class="btn btn-outline-success btn-sm"
                                            id="button_fill_up"
                                            onclick="showDates()">Next</button>
                                    </div>
                                </div>

                                <div id="test-l-3" class="content">
                                    <p>Review blood bag information</p>
                                    <div class="form-group">
                                        <input id="donor" name="donor" type="hidden" />
                                        <div class="card card-widget widget-user-2">
                                            <!-- Add the bg color to the header using any of the bg-* classes -->
                                            <div class="widget-user-header bg-info">
                                              <div class="widget-user-image">
                                                <img class="img-circle elevation-2" src="" id="type_image" alt="User Avatar">
                                              </div>
                                              <!-- /.widget-user-image -->
                                              <h3 class="widget-user-username" id="donor_name"></h3>
                                              <h5 class="widget-user-desc" id="blood_type"></h5>
                                            </div>
                                            <div class="card-footer p-0">
                                              <ul class="nav flex-column">
                                                <li class="nav-item">
                                                  <a href="#" class="nav-link">
                                                    Date Donated <span class="float-right badge bg-primary" id="ddonated_at"></span>
                                                  </a>
                                                </li>
                                                <li class="nav-item">
                                                  <a href="#" class="nav-link">
                                                    Date Expires <span class="float-right badge bg-info" id="dexpired_at"></span>
                                                  </a>
                                                </li>
                                              </ul>
                                            </div>
                                          </div>

                                        
                                    </div>
                                    <div class="mt-5">
                                        <a class="btn btn-outline-success btn-sm"
                                        onclick="stepper.previous()">Previous</a>
                                            
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
<!-- Transfer -->


<!-- Evaluate -->
<div class="modal fade" id="evaluate">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Inventory | Evaluate</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="bank-inventory-edit">
                @csrf

                <input type="text" id="edit_id" name="inventory" />
                <div class="form-group">
                    <label for="edit_evaluation" class="col-sm-3 control-label">Evaluation</label>
                    
                    <div class="col-sm-12">
                        <select class="form-control" id="edit_evaluation_id" name="evaluation" required="true">
                            <option value="" selected>- Select -</option>
                            @foreach ($evaluations as $evaluation)
                            <option value="{{$evaluation['id']}}">{{  $evaluation['id'] .' '.$evaluation['name']}}</option>
                            @endforeach
                        </select>
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



