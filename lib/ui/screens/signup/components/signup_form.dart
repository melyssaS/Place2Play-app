import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/controllers/user_controller.dart';
import 'package:place_2_play/domain/use_case/authentication.dart';
import 'package:place_2_play/ui/components/already_have_an_account_acheck.dart';
import 'package:place_2_play/ui/components/rounded_button.dart';
import 'package:place_2_play/ui/components/text_field_container.dart';
import 'package:place_2_play/constans.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  DateTime selectedDate = DateTime.now();
  String text = "Date of birth";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = "Date of birth";
  }

  @override
  Widget build(BuildContext context) {
    Authentication controller = Get.find();
    AuthenticationController authentication = Get.find();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController nickname = TextEditingController();

    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 30),
            child: const Text(
              "PLACE 2 PLAY",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          TextFieldContainer(
            text: "Your Email",
            inputColor: kPrimaryColor,
            textColor: kTextColor,
            icon: Icons.person,
            controller: email,
            keyType: TextInputType.emailAddress,
            obscureText: false,
          ),
          TextFieldContainer(
            text: "Your Password",
            inputColor: kPrimaryColor,
            textColor: kTextColor,
            icon: Icons.lock,
            controller: password,
            keyType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          TextFieldContainer(
            text: "Your Full Name",
            inputColor: kPrimaryColor,
            textColor: kTextColor,
            icon: Icons.text_fields,
            controller: name,
            keyType: TextInputType.name,
            obscureText: false,
          ),
          TextFieldContainer(
            text: "Your Nickname",
            inputColor: kPrimaryColor,
            textColor: kTextColor,
            icon: Icons.text_fields,
            controller: nickname,
            keyType: TextInputType.name,
            obscureText: false,
          ),
          GestureDetector(
              onTap: () => _selectDate(context, selectedDate),
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(29)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.calendar_month,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          text,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ))),
          const SizedBox(height: kDefaultPadding),
          RoundedButton(
              text: "Sign Up",
              press: () {
                if (_formKey.currentState!.validate()) {
                  signup(controller, authentication, email.text, password.text,
                      name.text, nickname.text, selectedDate);
                }
              },
              color: kPrimaryColor,
              textColor: kTextColor),
          const SizedBox(height: kDefaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () => Get.back(),
          ),
        ],
      ),
    );
  }

  void signup(
      Authentication controller,
      AuthenticationController authentication,
      String email,
      String password,
      String name,
      String username,
      DateTime dob) {
    controller.signup(email, password, name, username, dob);
    authentication.signup(email, password, name, username, dob);
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
        text = DateFormat.yMMMEd().format(date);
      });
    } else {
      date = DateTime.now();
      setState(() {
        date = DateTime.now();
        text = DateFormat.yMMMEd().format(date);
      });
    }
  }
}
