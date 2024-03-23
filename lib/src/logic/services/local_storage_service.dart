import 'package:get_storage/get_storage.dart';
import '../../views/utils/enums.dart';
import '../logger/logger.dart';

class LocalStorageService {
  static final box = GetStorage();

  // String value
  static String getString(String key, {String defaultValue = ''}) {
    Logger.log(tag: Tag.DEBUG, message: 'Getting string value for key: $key');
    return box.read(key) ?? defaultValue;
  }

  static Future<void> setString(String key, String value) async {
    await box.write(key, value);
    Logger.log(tag: Tag.DEBUG, message: 'Setting string value for key: $key');
  }

  // Bool value
  static bool getBool(String key, {bool defaultValue = false}) {
    Logger.log(tag: Tag.DEBUG, message: 'Getting bool value for key: $key');
    return box.read(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await box.write(key, value);
    Logger.log(tag: Tag.DEBUG, message: 'Setting bool value for key: $key');
  }

  // Int value
  static int getInt(String key, {int defaultValue = 0}) {
    Logger.log(tag: Tag.DEBUG, message: 'Getting int value for key: $key');
    return box.read(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await box.write(key, value);
    Logger.log(tag: Tag.DEBUG, message: 'Setting int value for key: $key');
  }

  // Double value
  static double getDouble(String key, {double defaultValue = 0.0}) {
    Logger.log(tag: Tag.DEBUG, message: 'Getting double value for key: $key');
    return box.read(key) ?? defaultValue;
  }

  static Future<void> setDouble(String key, double value) async {
    await box.write(key, value);
    Logger.log(tag: Tag.DEBUG, message: 'Setting double value for key: $key');
  }

  // List<T> value
  static List<T> getList<T>(String key, {List<T> defaultValue = const []}) {
    Logger.log(tag: Tag.DEBUG, message: 'Getting list value for key: $key');
    return box.read<List<T>>(key) ?? defaultValue;
  }

  static Future<void> setList<T>(String key, List<T> value) async {
    await box.write(key, value);
    Logger.log(tag: Tag.DEBUG, message: 'Setting list value for key: $key');
  }

  // Remove a value by key
  static Future<void> remove(String key) async {
    await box.remove(key);
    Logger.log(tag: Tag.DEBUG, message: 'Removing value for key: $key');
  }

  // Clear all stored values
  static Future<void> clear() async {
    Logger.log(tag: Tag.DEBUG, message: 'Clearing all stored values');
    await box.erase();
    Logger.log(tag: Tag.DEBUG, message: 'Cleared all stored values');
  }
}
