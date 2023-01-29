@include('includes/header')

<style>
    /* Set the size of the div element that contains the map */
    #map {
        height: 800px;
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
            <h1>Blood Reserve</h1>
        </div>
        @include('includes/navbar')
        @include('includes/menubar')

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <form class="form-horizontal" method="GET" action="check-count">
                        </form>
                        <div id="map">

                        </div>

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
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs&libraries=visualization&callback=initMap&v=weekly"
        defer></script>


    <!-- jQuery -->
    @include('includes/scripts')

    <script>
        var map;

        function initMap() {

            var unisan = {
                lat: 13.8635,
                lng: 122.0155
            };

            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 10,
                center: unisan,
                mapTypeId: 'satellite'
            });



            // add heatmap
            //       var heatmapData = [
            //   new google.maps.LatLng(13.8635, 122.0155),
            //   new google.maps.LatLng(13.8635, 122.0157),
            //   new google.maps.LatLng(13.8635, 122.0157),
            //   new google.maps.LatLng(13.8635, 122.0158),
            //   new google.maps.LatLng(13.8635, 122.0159),
            //   new google.maps.LatLng(13.8635, 122.0151),
            //   new google.maps.LatLng(13.8635, 122.0152),
            //   new google.maps.LatLng(13.8636, 122.0153),
            //   new google.maps.LatLng(13.8636, 122.0154),
            //   new google.maps.LatLng(13.8636, 122.0155),
            //   new google.maps.LatLng(13.8636, 122.0156),
            //   new google.maps.LatLng(13.8636, 122.0157),
            //   new google.maps.LatLng(13.8636, 122.0158),
            //   new google.maps.LatLng(13.8636, 122.0159)
            // ];

            // var heatmap = new google.maps.visualization.HeatmapLayer({
            //   data: heatmapData
            // });
            // heatmap.setMap(map);

            // DISPLAY MUNICIPALITIES ON MAP
            var municipalities = <?php print_r(json_encode($municipalities)); ?>;
            console.log(municipalities);
            $.each(municipalities, function(index, value) {
                var location = new google.maps.LatLng(value.latitude, value.longitude);
                var icon = 'images/municipalities/' + value.logo;
                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    icon: {
                        url: icon,
                        scaledSize: new google.maps.Size(80, 80)
                    },
                    title: value.name
                });

                var message = '<div id="content">' +
                    '<div id="siteNotice">' +
                    "</div>" +
                    '<h1 id="firstHeading" class="firstHeading"><b>' + value.name + '</b></h1>' +
                    '<h6 id="secondHeading" class="secondHeading"><b>Address:' + value.address +
                    '</b></h6>' +
                    '<div id="bodyContent">' +
                    '<a href="https://www.google.com/maps/dir/?api=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs&destination={' +
                    value.latitude + '},{' + value.longitude + '}" target="_blank">Open in Google Maps</a>'
                "</div>" +
                "</div>";
                addInfoWindow(marker, message);

            });
            // DISPLAY MUNICIPALITIES ON MAP

            // DISPLAY BLOOD BANKS ON MAP
            var banks = <?php print_r(json_encode($banks)); ?>;
            console.log(banks);
            $.each(banks, function(index, value) {

                var location = new google.maps.LatLng(value.latitude, value.longitude);
                var icon = 'images/banks/' + value.logo;
                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                    icon: {
                        url: icon,
                        scaledSize: new google.maps.Size(80, 80)
                    },
                    title: value.name
                });

                var message = '<div id="content">' +
                    '<div id="siteNotice">' +
                    "</div>" +
                    '<h1 id="firstHeading" class="firstHeading"><b>' + value.name + '</b></h1>' +
                    '<h6 id="secondHeading" class="secondHeading"><b>Address: ' + value.address +
                    '</b></h6>' +
                    '<div id="bodyContent">' +
                    '<a href="https://www.google.com/maps/dir/?api=AIzaSyAar1bBBZHXUmCVpb0YOwVjTysf4eY_bWs&destination={' +
                    value.latitude + '},{' + value.longitude + '}" target="_blank">Open in Google Maps</a>'
                "</div>" +
                "</div>";
                addInfoWindow(marker, message);

            });
            // DISPLAY BLOOD BANKS ON MAP

            // DISPLAY DONORS ON MAP
            var donors = <?php print_r(json_encode($donors)); ?>;
            //console.log(donors);
            var heatmapData = [];
            $.each(donors, function(index, value) {

                console.log("DONORS COUNT: " + value.donors_count);
                for (var i = 0; i < parseInt(value.donors_count); i++) {
                    heatmapData.push(new google.maps.LatLng(
                        parseFloat(value.municipality_latitude) + (Math.random() - 0.5) / 100,
                        parseFloat(value.municipality_longitude) + (Math.random() - 0.5) / 100
                    ));
                }
                console.log(heatmapData);

            });


            var heatmap = new google.maps.visualization.HeatmapLayer({
                data: heatmapData
            });

            heatmap.setMap(map);
            // DISPLAY DONORS ON MAP


            //map.data.addGeoJson(tarlac_polygon);    
        }

        function addInfoWindow(marker, message) {

            var infoWindow = new google.maps.InfoWindow({
                content: message
            });

            google.maps.event.addListener(marker, 'click', function() {
                infoWindow.open(map, marker);
            });
        }
    </script>

    <script>
        var intervalId = setInterval(function() {
            $.ajax({
                url: '/blood-reserve/public/inventories-count',
                type: 'GET',
                success: function(data) {
                    $.each(data, function(index, element) {
                        $.each(element, function(index, element2) {

                            if (element2.count < 5) {

                                var highest_donor_count = 0;
                                var recommended_municipality_id = 0;
                                var recommended_municipality_name = 0;
                                var recommended_municipality_latitude = 0;
                                var recommended_municipality_longitude = 0;
                                console.log('BLOOD TYPE: ' + element2.type_name);
                                console.log('QTY: ' + element2.count);
                                console.log("BLOOD BAG IS LOW!");

                                $.ajax({
                                    url: '/blood-reserve/public/maps-recommender/' +
                                        element2.type_id,
                                    type: "GET",
                                    success: function(data2) {
                                        $.each(data2, function(index3,
                                            element3) {

                                            $.each(element3,
                                                function(index4,
                                                    element4) {

                                                    if (element4
                                                        .donors_count >
                                                        highest_donor_count
                                                    ) {
                                                        recommended_municipality_id
                                                            =
                                                            element4
                                                            .municipality_id;
                                                        recommended_municipality_name
                                                            =
                                                            element4
                                                            .municipality_name;
                                                        recommended_municipality_latitude
                                                            =
                                                            element4
                                                            .municipality_latitude;
                                                        recommended_municipality_longitude
                                                            =
                                                            element4
                                                            .municipality_longitude;
                                                        //console.log('Recommended Location is ' + element4.municipality_name);

                                                        // ----------------------------------------

                                                    }




                                                });


                                            console.log(
                                                'Recommended Location is ' +
                                                recommended_municipality_name
                                            );
                                            
                                            clearInterval(
                                                intervalId);
                                        });
                                    }
                                });

                            }

                        });
                    });
                }
            });
        }, 5000);
    </script>

</body>

</html>
