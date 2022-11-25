import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
