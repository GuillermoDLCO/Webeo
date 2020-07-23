import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class Storage {
  saveString(key, value) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }
  saveBool(key, value) async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }
  deleteString(key) async {
    var pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
  deleteBool(key) async {
    var pref = await SharedPreferences.getInstance();
    pref.remove(key);
  }
  Future<String> getString(key) async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? null;
  }
  Future<bool> getBool(key) async {
    var pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }
}