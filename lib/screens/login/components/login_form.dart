import 'package:flutter/material.dart';
import 'package:place_2_play/components/already_have_an_account_acheck.dart';
import 'package:place_2_play/components/rounded_button.dart';
import 'package:place_2_play/components/text_field_container.dart';
import 'package:place_2_play/constans.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
          const TextFieldContainer(
            text: "Your Email",
            inputColor: kPrimaryColor,
            textColor: kTextColor,
            icon: Icons.person,
          ),
          const SizedBox(height: kDefaultPadding),
          const TextFieldContainer(
            text: "Password",
            inputColor: kPrimaryColor,
            textColor: kTextColor,
            icon: Icons.lock,
          ),
          const SizedBox(height: kDefaultPadding),
          RoundedButton(
              text: "Login",
              press: () {},
              color: kPrimaryColor,
              textColor: kTextColor),
          const SizedBox(height: kDefaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {},
          ),
        ],
      ),
    );
  }
}
