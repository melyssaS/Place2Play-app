import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/controllers/map_controller.dart';

class MapBody extends StatelessWidget {
   MapBody({Key? key, required this.initalPosition}) : super(key: key);

  MapsController mapsController = Get.find();

  CameraPosition initalPosition = CameraPosition(
    target: LatLng(11.010245, -74.815318),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
          initialCameraPosition: initalPosition,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          markers:  mapsController.getMarkers,
          ),
    );
  }
}
