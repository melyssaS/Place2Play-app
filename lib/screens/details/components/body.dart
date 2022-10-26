import 'package:flutter/material.dart';
import 'package:place_2_play/screens/details/components/description_event.dart';
import 'package:place_2_play/screens/details/components/event_title.dart';
import 'package:place_2_play/screens/details/components/gesture_buttons.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          EventTitle(
            text: "Toreno de Softball Interbarrio",
          ),
          DescriptionEvent(),
          GestureButtons()
        ],
      ),
    );
  }
}
