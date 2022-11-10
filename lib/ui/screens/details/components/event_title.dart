import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';

class EventTitle extends StatelessWidget {
  const EventTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(kDefaultPadding),
        child: Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding / 2),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor.withOpacity(0.8)),
          ),
        ));
  }
}
