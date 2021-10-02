import 'dart:async';
import 'package:hive/hive.dart';

class LocalStorageHive {
  Completer<Box> _instance = Completer<Box>();

  _init() async {
    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive() {
    this._init();
  }

  Future<String> getItem(key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  Future<List<String>> getList(key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  Future<void> setItem(key, value) async {
    var box = await _instance.future;
    box.put(key, value);
  }

  Future<void> deleteItem(key) async {
    var box = await _instance.future;
    box.delete(key);
  }
}
