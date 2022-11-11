import 'package:flutter/material.dart';
import 'package:place_2_play/ui/screens/form/component/form_detail.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: FormDetail(),
    );
  }
}
