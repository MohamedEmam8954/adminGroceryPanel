import 'package:shared_preferences/shared_preferences.dart';

class Cachehelper {
  static late SharedPreferences sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

abstract class CacheOperation {
  sendData({required String key, required dynamic value});
  dynamic get(String key);
}

class IntCacheOperation implements CacheOperation {
  @override
  get(String key) {
    return Cachehelper.sharedPreferences.get(key) ?? true;
  }

  @override
  sendData({required String key, required dynamic value}) async {
    return await Cachehelper.sharedPreferences.setInt(key, value);
  }
}

class StringCacheOperation implements CacheOperation {
  @override
  get(String key) {
    return Cachehelper.sharedPreferences.get(key) ?? true;
  }

  @override
  sendData({required String key, required dynamic value}) async {
    return await Cachehelper.sharedPreferences.setString(key, value);
  }
}

class BoolCacheOperation implements CacheOperation {
  @override
  get(String key) {
    return Cachehelper.sharedPreferences.get(key) ?? true;
  }

  @override
  sendData({required String key, required dynamic value}) async {
    return await Cachehelper.sharedPreferences.setBool(key, value);
  }
}

class RemoveDataCacheHelper {
  remove(String key) {
    return Cachehelper.sharedPreferences.remove(key);
  }
}

class FindDataCacheHelper {
  isAvailable(String key) {
    return Cachehelper.sharedPreferences.containsKey(key);
  }
}
