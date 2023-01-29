<!-- Add -->
<div class="modal fade" id="add">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Bank | New</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="bank-add" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Name & Logo</label>

                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="name" name="name">
                            <input type="file" id="logo"name="logo" />
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">Email</label>

                        <div class="col-sm-12">
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="contact" class="col-sm-3 control-label">Contact</label>

                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="contact" name="contact"
                                oninput="this.value = this.value.replace(/[^0-9 ]/g, '');">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label for="latitude" class="col-sm-6 control-label">Latitude</label>

                            </div>

                            <div class="col-sm-6">
                                <label for="longitude" class="col-sm-6 control-label">Longitude</label>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="latitude" name="latitude" >

                            </div>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="longitude" name="longitude" >
                            </div>
                        </div>
                    </div>

                    <div id="map">


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

<!-- Edit -->
<div class="modal fade" id="edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Bank | Edit</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="bank-update">
                    @csrf
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Name & Logo</label>
						
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="edit_name" name="name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">Email</label>

                        <div class="col-sm-12">
                            <input type="email" class="form-control" id="edit_email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="contact" class="col-sm-3 control-label">Contact</label>

                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="edit_contact" name="contact"
                                oninput="this.value = this.value.replace(/[^0-9 ]/g, '');">
                        </div>
                    </div>
                    
					<div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label for="edit_latitude" class="col-sm-6 control-label">Latitude</label>

                            </div>

                            <div class="col-sm-6">
                                <label for="edit_longitude" class="col-sm-6 control-label">Longitude</label>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="edit_latitude" name="latitude" >

                            </div>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="edit_longitude" name="longitude" >
                            </div>
                        </div>
                    </div>

					<div id="map2">


                    </div>

                    <div class="form-group">
                        <label for="edit_status" class="col-sm-3 control-label">Status</label>

                        <div class="col-sm-12">
                            <select class="form-control" id="edit_status" name="status" required>
                                <option value="" selected>- Select -</option>
                                <option value="1">Enabled</option>
                                <option value="0">Disabled</option>
                            </select>
                        </div>
                    </div>

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Update</button>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<!-- Edit -->

<!-- Delete -->
<div class="modal fade" id="delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Bank | Delete</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="POST" action="bank-delete">
                    @csrf
                    <input type="hidden" id="delete_id" name="id">
                    <div class="text-center">
                        <h2 class="bold"> Are you sure you want to delete this Bank?</h2>
                    </div>

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal"> Close</button>
                <button type="submit" class="btn btn-danger"> Delete</button>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<!-- Delete -->
