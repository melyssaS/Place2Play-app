import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/main.dart';
import 'package:place_2_play/ui/screens/details/detail_screen.dart';

class FeaturedEvents extends StatelessWidget {
  const FeaturedEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FeatureEventCard(
                image: "assets/images/football.jpeg",
                press: () {},
              ),
              FeatureEventCard(
                image: "assets/images/baseball.jpeg",
                press: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FeatureEventCard(
                image: "assets/images/football.jpeg",
                press: () {},
              ),
              FeatureEventCard(
                image: "assets/images/baseball.jpeg",
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureEventCard extends StatelessWidget {
  const FeatureEventCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.snackbar('Informacion', 'Nuevos eventos'),
      child: Container(
        margin: const EdgeInsets.only(
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.4,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
