import 'package:flutter/material.dart';
import 'package:place_2_play/ui/components/my_botton_nav_bar.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/signup/components/body.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: const Icon(
          Icons.local_activity,
          color: kPrimaryColor,
        ),
      ),
      body: const Body(),
    );
  }
}
