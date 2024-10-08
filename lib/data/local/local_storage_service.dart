// A class for handling local storage operations using shared preferences.
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  /// Asynchronous method to retrieve a string value from local storage by a given key.
  static Future<String?> getString(String key) async {
    //  final prefs = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  /// Asynchronous method to set a string value in local storage with a given key.
  static Future<void> setString(String key, String value) async {
    //  final prefs = await SharedPreferences.getInstance();
    await instance.setString(key, value);
  }

  /// Asynchronous method to retrieve a boolean value from local storage by a given key.
  static Future<bool?> getBool(String key) async {
    //  final prefs = await SharedPreferences.getInstance();
    return instance.getBool(key);
  }

  /// Asynchronous method to set a boolean value in local storage with a given key.
  static Future<void> setBool(String key, bool value) async {
    //  final prefs = await SharedPreferences.getInstance();
    await instance.setBool(key, value);
  }

  /// Asynchronous method to retrieve an integer value from local storage by a given key.
  static Future<int?> getInt(String key) async {
    //  final prefs = await SharedPreferences.getInstance();
    return instance.getInt(key);
  }

  /// Asynchronous method to set an integer value in local storage with a given key.
  static Future<void> setInt(String key, int value) async {
    //  final prefs = await SharedPreferences.getInstance();
    await instance.setInt(key, value);
  }

  /// Asynchronous method to retrieve a double value from local storage by a given key.
  static Future<double?> getDouble(String key) async {
    //  final prefs = await SharedPreferences.getInstance();
    return instance.getDouble(key);
  }

  /// Asynchronous method to set a double value in local storage with a given key.
  static Future<void> setDouble(String key, double value) async {
    //  final prefs = await SharedPreferences.getInstance();
    await instance.setDouble(key, value);
  }

  /// Asynchronous method to retrieve a list of strings from local storage by a given key.
  static Future<List<String>?> getStringList(String key) async {
    //  final prefs = await SharedPreferences.getInstance();
    return instance.getStringList(key);
  }

  /// Asynchronous method to set a list of strings in local storage with a given key.
  static Future<void> setStringList(String key, List<String> value) async {
    //  final prefs = await SharedPreferences.getInstance();
    await instance.setStringList(key, value);
  }

  /// Asynchronous method to remove a value from local storage by a given key.
  static Future<void> remove(String key) async {
    // final prefs = await SharedPreferences.getInstance();
    await instance.remove(key);
  }

  /// Asynchronous method to clear all values from local storage.
  static Future<void> clearAll() async {
    // final prefs = await SharedPreferences.getInstance();
    await instance.clear();
  }
}
