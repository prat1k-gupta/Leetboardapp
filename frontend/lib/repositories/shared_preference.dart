import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepo {
  Future<String?> getStringDataFromSharedPreference(String keyName) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    String? keyValue = sharedPreferences.getString(keyName);
    return keyValue;
  }

  Future<int?> getIntDataFromSharedPreference(String keyName) async {
    final sharedPrefences = await SharedPreferences.getInstance();
    int? keyValue = sharedPrefences.getInt(keyName);
    return keyValue;
  }

  Future<bool?> getBoolDatFromLocalSharedPreference(String keyName) async {
    final sharedPrefences = await SharedPreferences.getInstance();

    bool? keyValue = sharedPrefences.getBool(keyName);

    return keyValue;
  }

  Future<List<String>?> getStringListSharedPreference(String keyName) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    List<String>? keyValue = sharedPreferences.getStringList(keyName);
    return keyValue;
  }

  Future<Object?> getDataFromSharedPreference(String keyName) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    Object? keyValue = sharedPreferences.get(keyName);

    return keyValue;
  }

  Future<double?> getDoubleDataFromSharedPreference(String keyName) async {
    final sharedPrefences = await SharedPreferences.getInstance();
    double? keyValue = sharedPrefences.getDouble(keyName);
    return keyValue;
  }

  Future<void> setIntDataInSharedPreference(
      String keyName, int keyValue) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(keyName, keyValue);
  }

  Future<void> setStringDataInSharedPreference(
      String keyName, String keyValue) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(keyName, keyValue);
  }

  Future<void> setDoubleDataInSharedPreference(
      String keyName, double keyValue) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(keyName, keyValue);
  }

  Future<void> setBoolDataInSharedPreference(
      String keyName, bool keyValue) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(keyName, keyValue);
  }

  Future<void> setStringListDataInSharedPreference(
      String keyName, List<String> keyValue) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(keyName, keyValue);
  }
}
