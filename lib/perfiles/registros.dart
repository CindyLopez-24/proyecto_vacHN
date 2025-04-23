
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegistrosScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registros"),
        backgroundColor: Colors.blueAccent,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(15.500372754778116, -88.02623747945479),
          zoom: 12.0,
        ),
        mapType: MapType.normal, 
        onMapCreated: (GoogleMapController controller) {
    
        },
        markers: {
        const  Marker(
            markerId: MarkerId("marker1"),
            position: LatLng(15.500372754778116, -88.02623747945479),
            infoWindow: InfoWindow(
              title: "Centro de Salud mas cercano",
              snippet: "CIS Miguel Paz Barahona",
            ),
          ),
        },
      ),
    );
  }
}