import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/controllers/map_controller.dart';
import 'package:place_2_play/domain/repositories/event_repository.dart';
import 'package:place_2_play/domain/repositories/map_repository.dart';
import 'package:place_2_play/domain/use_case/event.dart';
import 'package:place_2_play/domain/use_case/map.dart';
import 'package:place_2_play/ui/screens/home/home_screen.dart';
import 'package:place_2_play/domain/repositories/user_repository.dart';
import 'package:place_2_play/domain/use_case/authentication.dart';
import 'package:place_2_play/controllers/user_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => Authentication(), fenix: true);
    Get.lazyPut(() => EventRepository(), fenix: true);
    Get.lazyPut(() => EventUseCase(), fenix: true);
    Get.lazyPut(() => MapRepository(), fenix: true);
    Get.lazyPut(() => MapsController(), fenix: true);
    Get.lazyPut(() => MapUseCase(), fenix: true);
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
      home: const HomeScreen(),
    );
  }
}
