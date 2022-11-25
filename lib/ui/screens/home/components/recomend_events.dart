import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/details/detail_screen.dart';

class RecomendsEvents extends StatelessWidget {
  const RecomendsEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendEventCard(
            image: "assets/images/football.jpeg",
            title: "Juego de soccer",
            country: "Villa Campestre",
            hora: "8:00-10:00",
            press: () {},
            address: LatLng(11.014584, -74.823359),
          ),
          RecomendEventCard(
            image: "assets/images/baseball.jpeg",
            title: "Juego de soccer",
            country: "Villa Campestre",
            hora: "8:00-10:00",
            press: () {},
            address: LatLng(11.014584, -74.823359),
          ),
          RecomendEventCard(
            image: "assets/images/baseball.jpeg",
            title: "Baseball",
            country: "Villa Campestre",
            hora: "8:00-10:00",
            press: () {},
            address: LatLng(11.014584, -74.823359),
          ),
        ],
      ),
    );
  }
}

class RecomendEventCard extends StatelessWidget {
  const RecomendEventCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.country,
      required this.hora,
      required this.press,
      required this.address})
      : super(key: key);

  final String image, title, country;
  final String hora;
  final Function press;
  final LatLng address;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.snackbar('Informacion', 'Juego de soccer'),
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding,
        ),
        width: size.width * 0.8,
        height: 300,
        child: Column(
          children: <Widget>[
            Container(
              width: size.width * 0.8,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            GestureDetector(
              onTap: press(),
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$title\n".toUpperCase(),
                              style: Theme.of(context).textTheme.button),
                          TextSpan(
                            text: "$country".toUpperCase(),
                            style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      '$hora',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
