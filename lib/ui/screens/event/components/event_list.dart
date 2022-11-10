import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          EventCard(
            image: "assets/images/baseball.jpeg",
            title: "Juego de soccer",
            price: "5000",
          ),
          EventCard(
            image: "assets/images/baseball.jpeg",
            title: "Juego de soccer",
            price: "5000",
          ),
          EventCard(
            image: "assets/images/baseball.jpeg",
            title: "Juego de soccer",
            price: "5000",
          ),
          EventCard(
            image: "assets/images/baseball.jpeg",
            title: "Juego de soccer",
            price: "5000",
          ),
          EventCard(
            image: "assets/images/baseball.jpeg",
            title: "Juego de soccer",
            price: "5000",
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  final String image;
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
      ),
      width: size.width,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding / 2,
            ),
            width: size.width * 0.4,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              FittedBox(
                  fit: BoxFit.fitWidth, child: Text('Hey this is my event')),
              Icon(Icons.location_on),
            ],
          )
        ],
      ),
    );
  }
}
