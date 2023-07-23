// ignore_for_file: prefer_collection_literals

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const  MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}


class _MapaScreenState extends State<MapaScreen> {

  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 18,
    tilt: 50
  );

  //Marcadores
  Set<Marker> markers = Set<Marker>();
  markers.add( Marker(
    markerId: const MarkerId('geo-location'),
    position: scan.getLatLng(),
  ));


    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            icon: const Icon( Icons.my_location ),
            onPressed: () async{
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 18,
                    tilt: 50
                  )
                ));
            }, 
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.layers ),
        onPressed: (){
          mapType == MapType.normal 
            ? mapType = MapType.satellite 
            : mapType = MapType.normal;

          setState(() {});
        },
      ),
    );
  }
}