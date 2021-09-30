import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:piaui_app/app/shared/database/local_storage.dart';
import 'package:piaui_app/app/shared/downloads/api_download.dart';
import 'package:piaui_app/app/shared/downloads/model/materia.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';

class DownloadsController {
  final LocalStorageHive local = LocalStorageHive();
  final ApiDownload apiDownload = ApiDownload();
  findAll() async {}

  Future<String> getByKey(key) async {
    return await local.getItem(key);
  }

  _saveRevist(RevistDownload magazine) async {
    await local.setItem(
        'edicao_' + (magazine.edicao).toString(), jsonEncode(magazine));
  }

  Future<List<String>> getMyList() async {
    var list = await local.getList('my_list');
    if (list == null) {
      list = [];
    }
    return list;
  }

  _addRevistMyList(String magazineId) async {
    List<String> listString = await getMyList();
    if (listString == null) {
      listString = [];
    }

    if (!((listString.where((element) => (element == magazineId))).length >
        0)) {
      listString = listString.toList();
      listString.add(magazineId);
    }

    await local.setItem('my_list', listString);
  }

  addRevist(RevistDownload magazine) async {
    List<String> listString = await getMyList();
    if (listString == null) {
      listString = [];
    }
    listString.toList();
    if (!((listString.where((element) =>
            (element == 'edicao_' + (magazine.edicao.toString())))).length >
        0)) {
      await _saveRevist(magazine);
      await _addRevistMyList('edicao_' + (magazine.edicao.toString()));
    }
  }

  Future<List<RevistDownload>> populateList() async {
    List<String> listString = await getMyList();
    if (listString == null) {
      listString = [];
    }
    List<RevistDownload> revists = [];
    for (var i = 0; listString.length > i; i++) {
      Map<String, dynamic> revist = jsonDecode(await getByKey(listString[i]));
      revists.add(RevistDownload(
          revist['ediciao'],
          revist['capa'],
          revist['numberEdition'],
          revist['mes'],
          revist['ano'],
          revist['materias']));
    }

    return revists;
  }
}
