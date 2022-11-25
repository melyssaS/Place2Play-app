import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/controllers/user_controller.dart';
import 'package:place_2_play/ui/screens/map/map_screen.dart';

import '../../../../domain/entities/event.dart';

class GestureButtons extends StatelessWidget {
  GestureButtons({super.key, required this.value, required this.event});

  LatLng value = LatLng(11.010245, -74.815318);
  Event event;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CameraPosition positon = CameraPosition(
      target: value,
      zoom: 15,
    );

    AuthenticationController authController = Get.find();

    return Container(
      width: size.width,
      child: Column(
        children: [
          GestureDetector(
            child: Button(
              icon: Icons.favorite,
              title: "Añadir a Favoritos",
            ),
            onTap: () {
              authController.addToFavorites(event);
              Get.snackbar("Informacion", "Añadido a Favoritos");
            },
          ),
          GestureDetector(
            child: Button(icon: Icons.location_on, title: "Ver ubicación"),
            onTap: () => Get.to(MapPage(position: positon)),
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: kPrimaryColor,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: kPrimaryColor),
        ),
      ],
    );
  }
}
