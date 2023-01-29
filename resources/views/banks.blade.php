@include('includes/header')
@include('includes/modal_banks')

<style>
    /* Set the size of the div element that contains the map */
    #map {
        height: 300px;
        /* The height is 400 pixels */
        width: 100%;
        /* The width is the width of the web page */
    }

    #map2 {
        height: 300px;
        /* The height is 400 pixels */
        width: 100%;
        /* The width is the width of the web page */
    }
</style>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="images/blood-reserve-logo.png" alt="Blood Reserve Logo" height="180"
                width="180">
        </div>

        @include('includes/navbar')
        @include('includes/menubar')

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">

            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Banks</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="{{ url('home') }}">Home</a></li>
                                <li class="breadcrumb-item active">Banks</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">

                @if ($errors->any())
                    <div class='alert alert-danger alert-dismissible'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        <h4><i class='icon fa fa-warning'></i> Error!</h4>
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                @if (session()->has('success'))
                    <div class='alert alert-success alert-dismissible'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                        <h4><i class='icon fa fa-check'></i> Success!</h4>
                        <ul>
                            {{ session()->get('success') }}
                        </ul>
                    </div>
                @endif

                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">

                        <div class="card" style="width:100%;">
                            <div class="card-header">
                                <a href="#add" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i
                                        class="fas fa-plus"></i> New</a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example2" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Logo</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone/Tel</th>
                                            <th>Address</th>
                                            <th>Status</th>
                                            <th>Tools</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        @foreach ($banks as $bank)
                                            <tr>
                                                <td><img src="{{ asset('images/banks/' . $bank['logo']) }}"
                                                        style="width:80px;height:80px;" alt="Bank Logo"></td>
                                                <td>{{ $bank['name'] }}</td>
                                                <td>{{ $bank['email'] }}</td>
                                                <td>{{ $bank['contact'] }}</td>
                                                <td>{{ $bank['address'] }}</td>
                                                
                                                <td><?php
                                                    if($bank['status'] == 1){
                                                        ?>
                                                    <center><span class="badge bg-green">ACTIVE</span></center>
                                                    <?php

                                                    }else{
                                                        ?>
                                                    <center><span class="badge bg-red">INACTIVE</span></center>
                                                    <?php
                                                    }
                                                ?>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-success btn-sm edit"
                                                        data-id="{{ $bank['id'] }}" data-name="{{ $bank['name'] }}"
                                                        data-email="{{ $bank['email'] }}"
                                                        data-contact="{{ $bank['contact'] }}"
                                                        data-latitude="{{ $bank['latitude'] }}"
                                                        data-longitude="{{ $bank['longitude'] }}"
                                                        data-status="{{ $bank['status'] }}"><i class="fas fa-edit"></i>
                                                        Edit</button>

                                                    <button type="button" class="btn btn-danger btn-sm delete"
                                                        data-id="{{ $bank['id'] }}"><i class="fas fa-trash"></i>
                                                        Delete</button>

                                                </td>
                                            </tr>
                                        @endforeach

                                    </tbody>
                                    <tfoot>

                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

            </section>
            <!-- right col -->
        </div>
        <!-- /.row (main row) -->
    </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    @include('includes/footer')

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs&libraries=visualization&callback=&v=weekly"
        defer></script>
    <!-- jQuery -->
    @include('includes/scripts')

    <script>
        $(function() {

            $('#example2 tbody').on("click", ".edit", function() {
                $('#edit').modal('show');
                var id = $(this).data('id');
                var name = $(this).data('name');
                var email = $(this).data('email');
                var contact = $(this).data('contact');
                var latitude = $(this).data('latitude');
                var longitude = $(this).data('longitude');
                var status = $(this).data('status');

                $('#edit_id').val(id);
                $('#edit_name').val(name);
                $('#edit_email').val(email);
                $('#edit_contact').val(contact);
                $('#edit_latitude').val(latitude);
                $('#edit_longitude').val(longitude);
                $('#edit_status').val(status).change();
            });

            $('#example2 tbody').on("click", ".delete", function() {
                $('#delete').modal('show');
                var id = $(this).data('id');

                $('#delete_id').val(id);
            });


        });
    </script>

    <script>
        $('#add').on('shown.bs.modal', function() {
            // Create a map


        });
    </script>

    <script>
        $('#add').on('hidden.bs.modal', function() {
            // Remove the map and marker
            $('#map').empty();
        });
    </script>

    <script>
        $(document).ready(function() {
            var unisan = {
                lat: 13.8635,
                lng: 122.0155
            };

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 10,
                center: unisan,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            map.setOptions({
                streetViewControl: false
            });
            map.setOptions({
                mapTypeControl: false
            });
            var marker;
            var marker_counter = 0
            google.maps.event.addListener(map, 'click', function(event) {

                if (marker != null) {
                    marker.setMap(null);
                }
                // Get the coordinates of the clicked location
                var clickedLocation = event.latLng;

                marker = new google.maps.Marker({
                    position: clickedLocation,
                    map: map,
                    draggable: true,
                    title: 'Bank Location'
                });

                $('#latitude').val(clickedLocation.lat());
                $('#longitude').val(clickedLocation.lng());

                google.maps.event.addListener(marker, 'drag', function(event) {
                    // Get the latitude and longitude of the marker's current position
                    $('#latitude').val(event.latLng.lat());
                    $('#longitude').val(event.latLng.lng());
                    // Output the latitude and longitude to the console
                });
            });

        });
    </script>


    <script>
        $(document).ready(function() {
            var unisan = {
                lat: 13.8635,
                lng: 122.0155
            };

            var map = new google.maps.Map(document.getElementById('map2'), {
                zoom: 10,
                center: unisan,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            map.setOptions({
                streetViewControl: false
            });
            map.setOptions({
                mapTypeControl: false
            });
            var marker;
            var marker_counter = 0
            google.maps.event.addListener(map, 'click', function(event) {

                if (marker != null) {
                    marker.setMap(null);
                }
                // Get the coordinates of the clicked location
                var clickedLocation = event.latLng;

                marker = new google.maps.Marker({
                    position: clickedLocation,
                    map: map,
                    draggable: true,
                    title: 'Bank Location'
                });
                $('#edit_latitude').val(clickedLocation.lat());
                $('#edit_longitude').val(clickedLocation.lng());

                google.maps.event.addListener(marker, 'drag', function(event) {
                    // Get the latitude and longitude of the marker's current position
                    $('#edit_latitude').val(event.latLng.lat());
                    $('#edit_longitude').val(event.latLng.lng());
                    // Output the latitude and longitude to the console
                });



            });



        });
    </script>


</body>

</html>
