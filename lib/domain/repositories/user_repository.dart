import 'package:loggy/loggy.dart';
import 'package:place_2_play/data/datasources/remote/user_remote_datasource.dart';
import 'package:place_2_play/data/datasources/local/user_local_shared_prefs.dart';
import 'package:place_2_play/domain/entities/user.dart';

// here we call the corresponding local source
class UserRepository {
  late UserRemoteDataSource remoteDataSource;
  late UserLocalSharedPrefs userLocalSharedPrefs;

  UserRepository() {
    logInfo("Starting UserRepository");
    remoteDataSource = UserRemoteDataSource();
    userLocalSharedPrefs = UserLocalSharedPrefs();
  }

  Future<void> storeUserInfo(User user) async {
    return await userLocalSharedPrefs.storeUserInfo(user);
  }

  Future<User> getStoredUser() async {
    try {
      return await userLocalSharedPrefs.getUserInfo();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> clearStoredUser() async {
    await userLocalSharedPrefs.clearUserInfo();
  }

  init() async => await userLocalSharedPrefs.init();

  login(email, password) async {
    await remoteDataSource.login(email, password);
    // return userMap.email.isNotEmpty ? true : false;
  }

  signup(email, password) async {
    await remoteDataSource.signUp(email, password);
  }

  logout() async {
    await remoteDataSource.logout();
    await userLocalSharedPrefs.logout();
  }

  clearAll() async {
    await userLocalSharedPrefs.deleteAll();
  }

  Future<bool> isStoringUser() async {
    return await userLocalSharedPrefs.isStoringUser();
  }
}
