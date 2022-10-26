import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/screens/details/detail_screen.dart';
import 'package:place_2_play/screens/event/events_screen.dart';
import 'package:place_2_play/screens/home/home_screen.dart';
import 'package:place_2_play/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Place2Place',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}
