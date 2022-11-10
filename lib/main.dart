import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/login/login_screen.dart';
import 'package:place_2_play/domain/repositories/user_repository.dart';
import 'package:place_2_play/domain/use_case/authentication.dart';
import 'package:place_2_play/controllers/user_controller.dart';
// import 'package:place_2_play/ui/screens/details/detail_screen.dart';
// import 'package:place_2_play/ui/screens/event/events_screen.dart';
// import 'package:place_2_play/ui/screens/home/home_screen.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => Authentication(), fenix: true);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  await FlutterConfig.loadEnvVariables();
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
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
