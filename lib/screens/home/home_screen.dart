import 'package:flutter/material.dart';
import 'package:place_2_play/components/my_botton_nav_bar.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ),
      body: Body(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
