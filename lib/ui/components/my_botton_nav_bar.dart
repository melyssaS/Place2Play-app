import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/event/events_screen.dart';
import 'package:place_2_play/ui/screens/home/home_screen.dart';

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
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () => Get.to(() => const EventScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () => Get.to(() => const EventScreen()),
          ),
        ],
      ),
    );
  }
}
