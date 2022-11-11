import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/controllers/user_controller.dart';
import 'package:place_2_play/domain/use_case/authentication.dart';
import 'package:place_2_play/ui/components/my_botton_nav_bar.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Authentication controller = Get.find();
    AuthenticationController authentication = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            controller.logout();
            authentication.logout();
          },
        ),
      ),
      body: Body(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
