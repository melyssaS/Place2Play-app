import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:place_2_play/ui/components/my_botton_nav_bar.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/details/components/body.dart';
import 'package:place_2_play/ui/screens/home/home_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, this.event});
  final Event? event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.to(() => const HomeScreen()),
        ),
      ),
      body: Body(event: event),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
