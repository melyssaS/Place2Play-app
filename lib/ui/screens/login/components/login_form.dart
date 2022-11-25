import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_2_play/controllers/user_controller.dart';
import 'package:place_2_play/domain/use_case/authentication.dart';
import 'package:place_2_play/ui/components/already_have_an_account_acheck.dart';
import 'package:place_2_play/ui/components/rounded_button.dart';
import 'package:place_2_play/ui/components/text_field_container.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/signup/signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    Authentication controller = Get.find();
    AuthenticationController authentication = Get.find();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Form(
      key: formKey,
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
          const SizedBox(height: kDefaultPadding),
          TextFieldContainer(
            text: "Password",
            inputColor: kPrimaryColor,
            textColor: kTextColor,
            icon: Icons.lock,
            controller: password,
            keyType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          const SizedBox(height: kDefaultPadding),
          RoundedButton(
              text: "Login",
              press: () {
                // print(
                //     "El email es ${email.text} y el password: ${password.text}");
                // if (_formKey.currentState!.validate()) {
                //   print("entro");
                if (formKey.currentState!.validate()) {
                  login(controller, authentication, email.text, password.text);
                }
                // }
              },
              color: kPrimaryColor,
              textColor: kTextColor),
          const SizedBox(height: kDefaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () => Get.to(() => const SingUpScreen()),
          ),
        ],
      ),
    );
  }

  void login(Authentication controller, AuthenticationController authentication,
      String email, String password) {
    controller.login(email, password);
    authentication.login(email, password);
  }
}
