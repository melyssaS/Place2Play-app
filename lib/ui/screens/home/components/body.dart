import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/home/components/featurred_events.dart';
import 'package:place_2_play/ui/screens/home/components/recomend_events.dart';
import 'package:place_2_play/ui/screens/home/components/title_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        SizedBox(height: kDefaultPadding),
        TitleSection(text: "Recomendados"),
        RecomendsEvents(),
        TitleSection(text: "Nuevos Eventos"),
        FeaturedEvents(),
      ]),
    );
  }
}
