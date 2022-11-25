import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:place_2_play/domain/entities/user.dart';
import 'package:place_2_play/domain/repositories/user_repository.dart';

// this file handles the business logic, calling the corresponding repository
class Authentication {
  UserRepository repository = Get.find();

  Future<bool> get init async => await repository.init();

  // if login is ok then data is stored on shared prefs
  Future<void> login(email, password) async {
    // bool existUser =
    await repository.login(email, password);
    // if (existUser) {
    //   await repository.storeUserInfo(User(email: email, password: password));
    // }
    // return existUser;
  }

  Future<void> signup(email, password,name,username,dob) async {
    await repository.signup(email, password,name,username,dob);
  }

  Future<void> logout() async {
    return await repository.logout();
  }

  Future<User> getStoredUser() async {
    return await repository.getStoredUser().onError((error, stackTrace) {
      return User(email: "", password: "");
    });
  }

  Future<void> clearStoredUser() async {
    return await repository.clearStoredUser();
  }

  clearAll() async {
    await repository.clearAll();
  }

  Future<bool> isStoringUser() async {
    return repository.isStoringUser();
  }
}
