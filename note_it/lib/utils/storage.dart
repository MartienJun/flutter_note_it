import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  uid,
  email,
}

class Storage {
  SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setUID(String uid) async {
    await _prefs.setString(StorageKey.uid.toString(), uid);
  }

  String getUID() {
    return _prefs.getString(StorageKey.uid.toString());
  }

  Future<void> clearUID() async {
    await _prefs.remove(StorageKey.uid.toString());
  }

  Future<void> setEmail(String email) async {
    await _prefs.setString(StorageKey.email.toString(), email);
  }

  String getEmail() {
    return _prefs.getString(StorageKey.email.toString());
  }
}