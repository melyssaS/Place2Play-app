import "package:flutter/material.dart";

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {super.key,
      this.controller,
      required this.text,
      required this.inputColor,
      required this.textColor,
      required this.icon,
      required this.keyType,
      required this.obscureText});

  final String text;
  final Color inputColor, textColor;
  final IconData icon;
  final TextInputType keyType;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: inputColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(29)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: inputColor,
            ),
            hintText: text,
            border: InputBorder.none),
        keyboardType: keyType,
        obscureText: obscureText,
        validator: (t) {
          if (t!.isEmpty) {
            return "You must provide ${text.toLowerCase()}";
          }
          return null;
        },
      ),
    );
  }
}
