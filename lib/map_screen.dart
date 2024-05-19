import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool openMap = false;

  ///initial Camera Position
  static CameraPosition cameraPosition = const CameraPosition(
      target: LatLng(33.6995, 73.0363),
      zoom: 15
  );

  ///Map Controller
  static Completer<GoogleMapController> mapController = Completer<GoogleMapController>();


  ///Markers List
  List<Marker> markers = [
    const Marker(
        markerId: MarkerId('Islamabad'),
        position: LatLng(33.6995, 73.0363),
        infoWindow: InfoWindow(title: 'Islamabad Pakistan')
    ),
    const Marker(
        markerId: MarkerId('Royal Crown'),
        position: LatLng(33.7057, 73.0349),
        infoWindow: InfoWindow(title: 'Royal Crown')
    )
  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: openMap
          ? GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        markers: Set<Marker>.of(markers),
        onMapCreated: (GoogleMapController controller){
          mapController.complete(controller);
        },

      )
          : SafeArea(
            child: Center(
              child: Column(

                children: [
                  SizedBox(height: 20),
            
                  Image.asset('assets/earth.gif'),
                  ElevatedButton(onPressed: (){setState(() {
                          openMap = true;
                        });}, child: Text('OPen Google Map', style: TextStyle(fontSize: 25),)),
                ],
              ),
            ),
          ),
    );
  }
}
