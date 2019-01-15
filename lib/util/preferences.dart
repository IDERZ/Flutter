import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static void init() async {
    _prefsInstance = await _prefs;
  }

  static Set<String> getKeys() {
    return _prefsInstance.getKeys();
  }

  static void put(String key, dynamic value) async {
    if (_prefsInstance == null) {
      _prefsInstance = await _prefs;
    } 

    if (value is String) {
      _prefsInstance.setString(key, value);
    } else if (value is double) {
      _prefsInstance.setDouble(key, value);
    } else if (value is int) {
      _prefsInstance.setInt(key, value);
    } else if (value is bool) {
      _prefsInstance.setBool(key, value);
    }    
  }

  static dynamic get(String key)  {    
    return _prefsInstance.get(key);
  }

  static void remove(String key) {    
    _prefsInstance.remove(key);
  }
  // 277053315
  static String getStr(String key) {
    print("key: " + key);
    print(_prefsInstance);
    String value;
    if (_prefsInstance == null) {
      getStrF(key).then((v){value = v;});
    } else {
      value = _prefsInstance.getString(key);
    }

    print(value);

    return value ?? "";    
  }

  static Future<String> getStrF(String key) async {    
    _prefsInstance = await _prefs;      
    return _prefsInstance.getString(key) ?? "";
  }

  static bool getBln(String key) {
    print("key: " + key);
    print(_prefsInstance.hashCode);
    bool value; 
    if (_prefsInstance == null) {
      getBlnF(key).then((v){value = v;});
    } else {
      value = _prefsInstance.getBool(key);
    }
    print(value);
    return  value ?? false;
  }

  static Future<bool> getBlnF(String key) async {    
    _prefsInstance = await _prefs;
    return _prefsInstance.getBool(key) ?? false;
  }

  // static int getInt(String key) {
  //   return _getPrefs().getInt(key) ?? 0;
  // }

  // static Future<int> getIntF(String key) async {    
  //   _prefsInstance = await _prefs;
  //   return _prefsInstance.getInt(key) ?? 0;
  // }

  // static double getDbl(String key) {
  //   return _getPrefs().getDouble(key) ?? 0.0;
  // }

  // static Future<double> getDblF(String key) async {    
  //   _prefsInstance = await _prefs;
  //   return _prefsInstance.getDouble(key) ?? 0.0;
  // }
}