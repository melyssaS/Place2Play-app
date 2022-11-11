import 'package:flutter/material.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:place_2_play/ui/screens/details/components/description_event.dart';
import 'package:place_2_play/ui/screens/details/components/event_title.dart';
import 'package:place_2_play/ui/screens/details/components/gesture_buttons.dart';

class Body extends StatelessWidget {
  const Body({super.key, this.event});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EventTitle(
            text:
                event != null ? event!.title : "Toreno de Softball Interbarrio",
          ),
          DescriptionEvent(description: event?.description ?? ""),
          GestureButtons()
        ],
      ),
    );
  }
}
