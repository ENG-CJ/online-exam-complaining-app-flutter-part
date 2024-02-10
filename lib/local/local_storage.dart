import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  Future<SharedPreferences> _initLocalStorage() async {
    var sharedPref = await SharedPreferences.getInstance();
    return sharedPref;
  }

  Future<String> getLocalDataValue(String key)async{
    var local = await _initLocalStorage();
    return local.get(key).toString();
  }
  Future<void> createLocalData(Map<String, dynamic> json) async {
    var data = await _initLocalStorage();
    data.setString("username", json['username']);
    data.setString("id", json['id']);
    data.setString("image", json['image']);
  }

  Future<void> clearLocalData() async {
    await _initLocalStorage().then((value) {
      value.clear();
    });
  }
}
