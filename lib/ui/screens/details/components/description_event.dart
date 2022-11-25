import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';

class DescriptionEvent extends StatelessWidget {
  const DescriptionEvent(
      {super.key,
      required this.description,
      required this.day,
      required this.deporte,
      required this.hour});
  final String description;
  final String day;
  final String deporte;
  final String hour;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageBox(image: "assets/images/baseball.jpeg"),
            EventInformation(
              hour: hour,
              day: day,
              place: deporte,
            )
          ],
        ),
        Description(
          description: description != null
              ? description
              : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sit amet vulputate lorem. Quisque lacinia nulla at sapien lobortis, in ornare magna pharetra",
        )
      ],
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
          left: kDefaultPadding),
      width: size.width * 0.4,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }
}

class EventInformation extends StatelessWidget {
  EventInformation(
      {super.key, required this.hour, required this.day, required this.place});

  String hour;
  String day;
  String place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hora",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: kPrimaryColor.withOpacity(0.8),
          ),
        ),
        Text(
          hour,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: kTextColor.withOpacity(0.8),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Dia",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: kPrimaryColor.withOpacity(0.8),
          ),
        ),
        Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: kTextColor.withOpacity(0.8),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Deporte",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: kPrimaryColor.withOpacity(0.8),
          ),
        ),
        Text(
          place,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: kTextColor.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: description,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: kTextColor.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
