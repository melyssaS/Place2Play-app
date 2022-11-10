import 'package:flutter/material.dart';
import 'package:place_2_play/ui/screens/login/components/login_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: LoginForm(),
    );
  }
}
