import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/controllers/user_controller.dart';
import 'package:place_2_play/ui/screens/favorites/components/body.dart';

import '../../../constans.dart';
import '../../components/my_botton_nav_bar.dart';

class FavoritesPage extends StatelessWidget {
 const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
