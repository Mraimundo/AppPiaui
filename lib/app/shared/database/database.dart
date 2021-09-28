import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  static Future<void> initHiveDatabase() async {
    await Hive.initFlutter();
  }
}
