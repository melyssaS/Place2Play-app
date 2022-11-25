import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_2_play/ui/screens/map/components/body.dart';

import '../../../constans.dart';
import '../../components/my_botton_nav_bar.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key, required this.position}) : super(key: key);
  CameraPosition position;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back), onPressed: () => Get.back()),
      ),
      body: MapBody(
        initalPosition: position,
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
