import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:place_2_play/domain/entities/user.dart';
import 'package:place_2_play/domain/use_case/authentication.dart';

import '../domain/entities/event.dart';

// the controller does not have business logic, it sends the request to the corresponding use case
class AuthenticationController extends GetxController {
  var _logged = false.obs;
  var _storeUser = false.obs;
  var _storeUserEmail = "".obs;
  var _storeUserPassword = "".obs;
  RxList<Event> _likedEvents = <Event>[].obs;
  RxList<Event> filteredList = <Event>[].obs;
  final filter = "".obs;

  final Authentication _authentication = Get.find<Authentication>();

  AuthenticationController() {
    initializeLoggedState();
  }

  // it updated logged according to the data on sharedPrefs
  void initializeLoggedState() async {
    logged = await _authentication.init;
  }

  String get storeUserPassword => _storeUserPassword.value;
  String get storeUserEmail => _storeUserEmail.value;
  bool get storeUser => _storeUser.value;
  List get getFavorites => _likedEvents;

  // it returns _logged, if it is true it calls getStoredUser
  bool get logged => _logged.value;

  // besides updating _storeUser, if false it clears stored data
  set storeUser(bool mode) {
    _storeUser.value = mode;
  }

  // updates _logged
  set logged(bool mode) {
    _logged.value = mode;
  }

  addToFavorites(Event event) {
    logInfo(event.title);
    _likedEvents.add(event);
    logInfo(_likedEvents.length);
    filteredList.value = _likedEvents;
    _likedEvents.refresh();
  }

  String get getFilter {
    return filter.value;
  }

  void changeFilter(String newfilter) {
    filter.value = newfilter;
  }

  void filterCategory(String newFilter) {
    List<Event> copyOfProducts = List<Event>.from(_likedEvents);

    if (newFilter.isEmpty || newFilter == "All") {
      filteredList.value = copyOfProducts;
    } else {
      filteredList.value =
          copyOfProducts.where((p0) => p0.deporte == newFilter).toList();
    }
    filteredList.refresh();
  }

  void runFilter(String enteredKeyword) {
    List<Event> copyOfProducts = List<Event>.from(_likedEvents);
    if (enteredKeyword.isEmpty) {
      filteredList.value = copyOfProducts;
    } else {
      filteredList.value = copyOfProducts
          .where((product) => product.title
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    filteredList.refresh();
  }

  // this method should clean the user data on sharedPrefs and controller
  Future<void> clearStoredUser() async {
    await _authentication.clearStoredUser();
  }

  // this method gets the stored user on sharedPrefs and updates the data on
  // the controller
  Future<void> getStoredUser() async {
    User user = await _authentication.getStoredUser();
    logInfo(
        'AuthenticationController getStoredUser and got <${user.email}> <${user.password}>');
  }

  // this method clears all stored data
  clearAll() async {
    await _authentication.clearAll();
  }

  // used to send login data, if user data is ok and if storeUser is true
  // it also stores the user on controller
  Future<bool> login(user, password) async {
    // bool response =
    await _authentication.login(user, password);
    // if (response) {
    //   _logged.value = true;
    //   _storeUser.value = false;
    //   _storeUserEmail.value = user;
    //   _storeUserPassword.value = password;
    // }
    // return response;
    return true;
  }

  // used to send signup data
  Future<bool> signup(user, password, name, username, dob) async {
    await _authentication.signup(user, password, name, username, dob);
    return true;
  }

  // used to logout the current user
  void logout() async {
    await _authentication.logout();
    _logged.value = false;
    _storeUser.value = false;
    _storeUserEmail.value = "";
    _storeUserPassword.value = "";
  }
}
