import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheNetwork {
  static late SharedPreferences sharedPref;

  static Future cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future insertToCache(
      {required String key, required String value}) async {
    return await sharedPref.setString(key, value);
  }

  static getCacheData({required String key}) {
    return sharedPref.getString(key) ?? '';
  }

  static Future deleteCacheItem({required String key}) {
    return sharedPref.remove(key);
  }
}
