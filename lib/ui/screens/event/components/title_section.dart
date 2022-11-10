import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
