  import 'dart:async';

  import 'package:app_spacex/core/manager/launches_manager.dart';
  import 'package:flutter/material.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';

  class MapLandpads extends StatelessWidget {
  const MapLandpads ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapSample(),
    );
  }
  }


  class MapSample extends StatefulWidget {
    const MapSample({Key? key}) : super(key: key);

    @override
    State<MapSample> createState() => MapSampleState();
  }

  class MapSampleState extends State<MapSample> {
    final Map<String, Marker> _markers = {};

    static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(40.74852645697476, -97.10006353817981),
      zoom: 3,
    );


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: _markers.values.toSet(),
          onMapCreated:_onMapCreated,
        ),
      );
    }

    void _onMapCreated(GoogleMapController controller) {
      final landpadList = LaunchesManager().landpad;
      setState(() {
        _markers.clear();
        for (final landpad in landpadList ) {
          final marker = Marker(
            markerId: MarkerId(landpad.full_name ?? "oups"),
            position: LatLng(landpad.latitude ?? 0.0 , landpad.longitude ?? 0.0 ),
            infoWindow: InfoWindow(
              title: landpad.full_name,
              snippet: landpad.details,
            ),
          );
          _markers[landpad.id] = marker;
        }
      });

    }

  }
