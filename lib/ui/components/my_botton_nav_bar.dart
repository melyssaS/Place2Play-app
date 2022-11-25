import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/event/events_screen.dart';
import 'package:place_2_play/ui/screens/favorites/favorites_screen.dart';
import 'package:place_2_play/ui/screens/form/form_screen.dart';
import 'package:place_2_play/ui/screens/home/home_screen.dart';
import 'package:place_2_play/ui/screens/map/map_screen.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1),
            blurRadius: 10,
            color: kPrimaryColor.withOpacity(0.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () => Get.to(() => const FavoritesPage()),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Get.to(() => const FormScreen())),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () => Get.to(() => const EventScreen()),
          ),
        ],
      ),
    );
  }
}
