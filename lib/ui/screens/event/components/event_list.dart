import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:place_2_play/domain/use_case/event.dart';
import 'package:place_2_play/ui/screens/details/detail_screen.dart';

class EventList extends StatefulWidget {
  EventUseCase event = Get.find();

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: getCards(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
            if (snapshot.hasData) {
              final cards = snapshot.data ?? [];
              //cards.insert(0, SearchField());
              return SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [...cards]));
            }
            return const Text('No eventos creados');
          },
        ));
  }

  Future<List<Widget>> getCards() async {
    final events = await widget.event.getAllEvents();
    final eventsList = List.generate(
        events.length,
        (index) => EventCard(
              image: "assets/images/baseball.jpeg",
              title: events[index].title,
              event: events[index],
              price: events[index].price.toString(),
              description: events[index].description,
              address: events[index].address,
            )).toList();
    // usersList.insert(0, SearchField());
    return eventsList;
  }
}

class EventCard extends StatelessWidget {
  const EventCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.description,
      required this.address,
      this.event});
  final Event? event;
  final String image;
  final String title;
  final String price;
  final String description;
  final LatLng address;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.to(() => DetailScreen(event: event)),
      child: Container(
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
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(description.substring(0, 20))),
                const Icon(Icons.location_on),
              ],
            )
          ],
        ),
      ),
    );
  }
}
