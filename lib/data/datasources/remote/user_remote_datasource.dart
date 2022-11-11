import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/login/login_screen.dart';
import 'package:place_2_play/ui/screens/home/home_screen.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserRemoteDataSource {
  Future<void> login(email, password) async {
    print("El email es ${email} y el password: ${password}");
    try {
      print("LOGIN FIREBASE");
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.to(() => const HomeScreen());
      return Future.value();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Information", "User not found!",
            icon: Icon(Icons.warning), backgroundColor: kPrimaryColor);
        return Future.error("User not found");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Information", "Wrong password!",
            icon: Icon(Icons.warning), backgroundColor: kPrimaryColor);
        return Future.error("Wrong password");
      } else {
        Get.snackbar("Information", "Not valid email!",
            icon: Icon(Icons.warning), backgroundColor: kPrimaryColor);
      }
    }
  }

  Future<void> addUser(String contra, String correo) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('users');
    final Map<String, String> users = HashMap();
    users.addAll({
      'Contraseña': contra,
      'Correo': correo,
      // 'Nombre': nombre,
      // 'Numero': numero,
      // "Direccion": address,
      // "Sexo": sexo
    });
    await collection.doc(getUid()).set(users);
  }

  Future<bool> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.to(() => const HomeScreen());

      await addUser(email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Information", "The password provided is too weak.",
            icon: Icon(Icons.warning), backgroundColor: kPrimaryColor);
        return Future.error(
          'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Information", "User already exist!",
            icon: Icon(Icons.warning), backgroundColor: kPrimaryColor);
        return Future.error('The account already exists for that email.');
      }
    }
    return true;
  }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.to(() => const LoginScreen());
    } catch (e) {
      return Future.error("Logout error");
    }
  }

  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email!;
    return email;
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }
}
