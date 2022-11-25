import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';
import 'package:place_2_play/controllers/map_controller.dart';
import 'package:place_2_play/data/utils/search_bar.dart';
import 'package:place_2_play/domain/use_case/event.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:place_2_play/ui/components/rounded_button.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/components/text_field_container.dart';
import 'package:place_2_play/ui/screens/home/components/title_section.dart';

import '../../../../data/datasources/local/event_local_datasource_sqflite.dart';

class FormDetail extends StatefulWidget {
  const FormDetail({super.key});

  @override
  State<FormDetail> createState() => _FormDetailState();
}

class _FormDetailState extends State<FormDetail> {
  MapsController mapController = Get.find();
  String initalDate = "Fecha inicio";
  String dropdownvalue = "Selecciona un deporte";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalDate = "Fecha inicio";
    dropdownvalue = "Selecciona un deporte";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late EventLocalDataSource localDataSource;

    EventUseCase event = Get.find();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    DateTime selectedDate = DateTime.now();
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController address = TextEditingController();

    // Initial Selected Value

    // List of items in our dropdown menu
    var items = [
      "Selecciona un deporte",
      'Futbol',
      'Voleyball',
      'Basketball',
      'Rugby',
    ];

    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: TitleSection(text: "Crear un evento"),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(29)),
                child: DropdownButton(
                  value: dropdownvalue,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    logInfo(newValue);
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: SearchBar(
                  placeholder: "Address",
                  onTextChangeCallback: (s) =>
                      mapController.findPlacePrediction(s),
                ),
              ),
              Obx(
                () => mapController.getPredictions.isNotEmpty
                    ? Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  height: 280.0,
                                  width: 370.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(25.0),
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  child: ListView.builder(
                                      itemCount:
                                          mapController.getPredictions.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                            leading: const CircleAvatar(
                                              backgroundColor: kPrimaryColor,
                                              child: Icon(
                                                Icons.map,
                                                color: Colors.white,
                                              ),
                                            ),
                                            title: Text(mapController
                                                .getPredictions[index]
                                                .description!),
                                            onTap: () async {
                                              await mapController
                                                  .findPlacePredictions(
                                                      mapController
                                                          .getPredictions[index]
                                                          .placeId!);
                                              mapController.predictionClear();
                                            });
                                      }))),
                        ],
                      )
                    : Container(),
              ),
              TextFieldContainer(
                text: "Title",
                inputColor: kPrimaryColor,
                textColor: kTextColor,
                icon: Icons.title,
                controller: title,
                keyType: TextInputType.text,
                obscureText: false,
              ),
              TextFieldContainer(
                text: "Descripcion",
                inputColor: kPrimaryColor,
                textColor: kTextColor,
                icon: Icons.title,
                controller: description,
                keyType: TextInputType.text,
                obscureText: false,
              ),
              TextFieldContainer(
                text: "Precio",
                inputColor: kPrimaryColor,
                textColor: kTextColor,
                icon: Icons.price_change,
                controller: price,
                keyType: TextInputType.number,
                obscureText: false,
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                    text: "Añadir",
                    press: () {
                      if (formKey.currentState!.validate()) {
                        event.addEvent(
                          Event(
                              description: description.text,
                              title: title.text,
                              start: DateTime.now(),
                              end: DateTime.now().add(const Duration(days: 20)),
                              price: double.parse(price.text),
                              category: UserCategory.created,
                              address: mapController.getPlacePredict,
                              deporte: dropdownvalue),
                        );
                        Get.back();
                      }
                    },
                    color: kPrimaryColor,
                    textColor: kTextColor),
              ),
            ])),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 6575)),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1950),
      lastDate: DateTime.now().subtract(const Duration(days: 6575)),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: kPrimaryColor, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
            ),
            child: child!);
      },
    );
    if (picked != null) {
      logInfo(picked);
      setState(() {
        date = picked;
        initalDate = DateFormat.yMMMEd().format(date);
      });
    } else {
      date = DateTime.now();
      setState(() {
        date = DateTime.now();
        initalDate = DateFormat.yMMMEd().format(date);
      });
    }
  }
}
