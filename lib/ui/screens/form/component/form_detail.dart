import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/domain/use_case/event.dart';
import 'package:place_2_play/domain/entities/event.dart';
import 'package:place_2_play/ui/components/rounded_button.dart';
import 'package:place_2_play/constans.dart';

class FormDetail extends StatefulWidget {
  const FormDetail({super.key});

  @override
  State<FormDetail> createState() => _FormDetailState();
}

class _FormDetailState extends State<FormDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EventUseCase event = Get.find();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController price = TextEditingController();
    return Container(
      width: size.width,
      child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InputBox(
              textLabel: "Titulo",
              maxlength: 20,
              controller: title,
            ),
            InputBox(
              textLabel: "Descripción",
              maxlength: 20,
              controller: description,
            ),
            InputBox(
              textLabel: "Precio",
              maxlength: 20,
              controller: price,
            ),
            RoundedButton(
                text: "Añadir",
                press: () {
                  event.addEvent(Event(
                      description: description.text,
                      title: title.text,
                      start: DateTime.now(),
                      end: DateTime.now(),
                      price: double.parse(price.text),
                      category: UserCategory.created));
                },
                color: kPrimaryColor,
                textColor: kTextColor),
          ])),
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox(
      {super.key,
      required this.textLabel,
      this.maxlength,
      this.filter = '',
      this.isEnabled = true,
      this.isOptional = false,
      this.value,
      this.controller});

  final String textLabel;
  final int? maxlength;
  final String? filter;
  final bool? isEnabled;
  final bool isOptional;
  final String? value;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: TextFormField(
        controller: controller,
        maxLength: maxlength,
        enabled: isEnabled,
        validator: (value) {
          if (value == null || value.isEmpty && !isOptional) {
            return 'Debe ingresar texto';
          }
        },
        // inputFormatters: [
        //   FilteringTextInputFormatter.allow(regexList[filter] ?? RegExp(r'')),
        // ],
        decoration: InputDecoration(
          labelText: textLabel,
          labelStyle: const TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: kPrimaryColor),
        ),
      ),
    );
  }
}
