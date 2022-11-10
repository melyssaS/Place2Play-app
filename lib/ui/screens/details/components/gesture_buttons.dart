import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';

class GestureButtons extends StatelessWidget {
  const GestureButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: const [
          Button(
            icon: Icons.favorite,
            title: "Añadir a Favoritos",
          ),
          Button(
            icon: Icons.shopping_bag,
            title: "Comprar Entrada",
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: kPrimaryColor,
        ),
        label: Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: kPrimaryColor),
        ));
  }
}
