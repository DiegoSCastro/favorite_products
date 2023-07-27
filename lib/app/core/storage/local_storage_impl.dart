import 'package:shared_preferences/shared_preferences.dart';

import '../../app.dart';

class LocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get instance async =>
      await SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sp = await instance;
    await sp.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sp = await instance;
    return sp.containsKey(key);
  }

  @override
  Future<P?> read<P>(String key) async {
    final sp = await instance;

    if (P == String) {
      return sp.getString(key) as P?;
    } else if (P == int) {
      return sp.getInt(key) as P?;
    } else if (P == bool) {
      return sp.getBool(key) as P?;
    } else if (P == double) {
      return sp.getDouble(key) as P?;
    } else if (P == List<String>) {
      return sp.getStringList(key) as P?;
    } else {
      throw Exception('Type not supported');
    }
  }

  @override
  Future<void> remove(String key) async {
    final sp = await instance;
    await sp.remove(key);
  }

  @override
  Future<void> write<P>(String key, P value) async {
    final sp = await instance;

    if (P == String) {
      await sp.setString(key, value as String);
    } else if (P == int) {
      await sp.setInt(key, value as int);
    } else if (P == bool) {
      await sp.setBool(key, value as bool);
    } else if (P == double) {
      await sp.setDouble(key, value as double);
    } else if (P == List<String>) {
      sp.setStringList(key, value as List<String>);
    } else {
      throw Exception('Type not supported');
    }
  }
}
