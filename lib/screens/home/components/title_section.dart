import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding / 2),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
