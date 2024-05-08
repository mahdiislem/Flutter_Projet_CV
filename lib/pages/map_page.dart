import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng( 34.7486, 10.7362), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User current location"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Replace this with your desired static position (latitude and longitude)
          LatLng staticPosition = LatLng( 34.7486, 10.7362);

          // Add a marker for the static position
          markers.add(Marker(markerId: MarkerId('static_position'), position: staticPosition));

          // Move the camera to the static position
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: staticPosition, zoom: 14)));

          setState(() {});
        },
        label: const Text("Static Position"),
        icon: const Icon(Icons.location_on),
      ),
    );
  }
}
