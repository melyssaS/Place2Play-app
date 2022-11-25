import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/event/components/event_list.dart';
import 'package:place_2_play/ui/screens/event/components/title_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: kDefaultPadding),
        TitleSection(text: "Recomendados"),
        SizedBox(height: kDefaultPadding),
        EventList()
      ]),
    );
  } 
}
