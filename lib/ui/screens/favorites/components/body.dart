import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:place_2_play/ui/screens/event/components/event_list.dart';
import 'package:place_2_play/ui/screens/event/components/title_section.dart';

import '../../../../controllers/user_controller.dart';
import '../../../../data/utils/search_bar.dart';

class Body extends StatelessWidget {
  Body({super.key});
  TextEditingController controller = TextEditingController();

  AuthenticationController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: kDefaultPadding),
        const TitleSection(text: "Favoritos"),
        const SizedBox(height: kDefaultPadding),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SearchBar(
              placeholder: "Search for a Product",
              onTextChangeCallback: (s) => userController.runFilter(s)),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: _tittleText("Filtros")),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.horizontal,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 5,
            children: [
              _filterCard(
                  "Futbol", Icons.sports_soccer, Colors.red, controller),
              _filterCard("Voleyball", Icons.sports_volleyball, Colors.blue,
                  controller),
              _filterCard("Basketball", Icons.sports_basketball, Colors.green,
                  controller),
              _filterCard(
                  "Rugby", Icons.sports_rugby, Colors.orange, controller),
            ],
          ),
        ),
        Obx(
          () => SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FutureBuilder(
                future: getCards(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Widget>> snapshot) {
                  if (snapshot.hasData) {
                    final cards = snapshot.data ?? [];
                    //cards.insert(0, SearchField());
                    return SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [...cards]));
                  }
                  return const Text('No favorite events');
                },
              )),
        )
      ]),
    );
  }

  Future<List<Widget>> getCards() async {
    final events = userController.filteredList;
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

  Widget _tittleText(text) {
    return Text(
      text,
      key: Key(text),
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _filterCard(String text, IconData icon, Color color,
      TextEditingController textcontroller) {
    return GestureDetector(
      key: Key(text),
      onTap: () {
        userController.changeFilter(text);
        userController.filterCategory(text);
      },
      child: Container(
        width: 150,
        height: 55,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color.withAlpha(100),
                blurRadius: 3,
                spreadRadius: 3,
                offset: const Offset(
                  0,
                  2,
                ),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardProduct(Event product) {
    return GestureDetector(
        key: Key(product.id.toString()),
        onTap: () => logInfo('tapped'),
        child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 328,
              height: 145,
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffE2E2EC)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _cardTitleText(trimName(product.title)),
                      _cardSubtitleText(product.description),
                      _cardSubtitleText("deporte: ${product.deporte}"),
                      _cardPriceText(product.price.toString())
                    ],
                  )
                ],
              ),
            )));
  }

  Widget _cardTitleText(String text) {
    return Text(
      text,
      key: Key(text),
      style: const TextStyle(
        color: Color.fromRGBO(56, 53, 88, 1),
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget _cardSubtitleText(String text) {
    return Text(text,
        key: Key(text),
        style: const TextStyle(
          color: Color.fromRGBO(127, 119, 198, 1),
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.left);
  }

  Widget _cardPriceText(String text) {
    return Text("$text COP",
        key: Key(text),
        style: const TextStyle(
          color: Color.fromRGBO(127, 119, 198, 1),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left);
  }

  String trimName(String name) {
    try {
      var splitted = name.split(' ');
      String trimmedName = splitted[0] + " " + splitted[1] + '...';
      return trimmedName;
    } catch (e) {
      return name;
    }
  }
}
