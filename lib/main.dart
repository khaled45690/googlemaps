import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final startAddressController = TextEditingController();
  Position positions;
  Set<Marker> _marker = HashSet<Marker>();
  Set<Polyline> polyline = {};
  List<LatLng> route = List();
  GoogleMapController _mapController;
  // GoogleMapPolyline googleMapPolyline = new  GoogleMapPolyline(apiKey:"AIzaSyCeaBTry2YnTPFGYdD6IJqtT4HjFtOr8As");

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
      _marker.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(positions.latitude, positions.longitude),
      ));
    });
  }

  void _handleTaps(value) async {
    // Prediction p = await PlacesAutocomplete.show(
    //     context: context,
    //     apiKey: "AIzaSyCeaBTry2YnTPFGYdD6IJqtT4HjFtOr8As",
    //     mode: Mode.overlay,
    //     location: null,
    //     radius: 1000000000000
    // );
    print(value.latitude);
    print(value.longitude);
    // var coordinates = await googleMapPolyline.getCoordinatesWithLocation(
    //     origin: LatLng(positions.latitude, positions.longitude) ,
    //     destination: LatLng(37.33839044316766, -122.06821437925099),
    //     mode: RouteMode.driving);
    print("coordinates");
    // print(coordinates);
  }

  void getLocation() async {
    // await openAppSettings();
    // LocationPermission permission = await requestPermission();
    // print(permission);
    // Position position =
    //     await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    // print(position.longitude);
    // setState(() {
    //   positions = position;
    // });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Google Maps"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.satellite,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onTap: _handleTaps,
            markers: _marker,
            initialCameraPosition: CameraPosition(
              target: LatLng(-8.463021, 115.260129),
              zoom: 80,
            ),
          ),
        ],
      ),
    );
  }
}
