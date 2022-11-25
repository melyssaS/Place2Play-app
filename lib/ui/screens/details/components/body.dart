import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:place_2_play/data/utils/models.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:place_2_play/ui/screens/details/components/description_event.dart';
import 'package:place_2_play/ui/screens/details/components/event_title.dart';
import 'package:place_2_play/ui/screens/details/components/gesture_buttons.dart';
import '../../../../controllers/map_controller.dart';

class Body extends StatelessWidget {
  Body({super.key, this.event});
  final Event? event;
  MapsController mapsController = Get.find();

  LatLng defaultPos = const LatLng(11.013657, -74.838207);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EventTitle(
            text:
                event != null ? event!.title : "Toreno de Softball Interbarrio",
          ),
          DescriptionEvent(
            description: event?.description ?? "This is my event",
            deporte: event?.deporte ?? "Futbol",
            day: event?.start != null
                ? DateFormat.yMMMEd().format(event!.start)
                : DateFormat.yMMMEd().format(DateTime.now()),
            hour: event?.start != null
                ? DateFormat.Hms().format(event!.start)
                : DateFormat.Hms().format(DateTime.now()),
          ),
          GestureButtons(
              value: event != null
                  ? _gestureAdder(event!.address)
                  : _gestureAdder(defaultPos),
              event: event!)
        ],
      ),
    );
  }

  LatLng _gestureAdder(position) {
    final marker = Marker(markerId: const MarkerId('1'), position: position);
    mapsController.addMarker(marker);
    return position;
  }
}
