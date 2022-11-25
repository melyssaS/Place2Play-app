import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loggy/loggy.dart';
import 'package:place_2_play/constans.dart';
import 'package:place_2_play/ui/screens/login/login_screen.dart';
import 'package:place_2_play/ui/screens/home/home_screen.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserRemoteDataSource {
  Future<void> login(email, password) async {
    logInfo("El email es $email y el password: $password");
    try {
      logInfo("LOGIN FIREBASE");
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.to(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Information", "User not found!",
            icon: const Icon(Icons.warning), backgroundColor: kPrimaryColor);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Information", "Wrong password!",
            icon: const Icon(Icons.warning), backgroundColor: kPrimaryColor);
      } else {
        Get.snackbar("Information", "Not valid email!",
            icon: const Icon(Icons.warning), backgroundColor: kPrimaryColor);
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

  Future<void> signUp(String email, String password, String name,
      String username, DateTime dob) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({'name': name, 'username': username, 'dob': dob});
      }

      Get.to(() => const HomeScreen());

      await addUser(email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Information", "The password provided is too weak.",
            icon: Icon(Icons.warning), backgroundColor: kPrimaryColor);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Information", "User already exist!",
            icon: Icon(Icons.warning), backgroundColor: kPrimaryColor);
      }
    }
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
