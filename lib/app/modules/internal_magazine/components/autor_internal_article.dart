import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:html/parser.dart';

Future<String> colaborador(id) async {
  final _url = "/wp-json/acf/v3/colaborador/" + id.toString();
  var dio = CustomDio().instance;
  var response = await dio.get(_url);
  return response.toString();
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class AutorInternalArticle extends StatelessWidget {
  List<dynamic> autor = [];
  AutorInternalArticle({Key key, this.autor}) : super(key: key);

  @override
  Widget build(context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 0),
        itemCount: autor.length,
        itemBuilder: (_, index) => FutureBuilder<String>(
            future: colaborador(autor[index]['ID']),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                      height: 100,
                      color: Theme.of(context).bottomAppBarColor,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 16, bottom: 9),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/allan_abreu.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 21, right: 8, bottom: 14),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          autor[index]["post_title"],
                                          style: TextStyle(
                                              height: 1.3,
                                              fontFamily: 'Piaui',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Theme.of(context).cardColor),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '(siga ' +
                                              _parseHtmlString(jsonDecode(
                                                          snapshot.data)["acf"][
                                                      "twitter_colaborador_arroba"]
                                                  .toString()) +
                                              'no Twitter)',
                                          style: TextStyle(
                                            height: 1.3,
                                            fontFamily: 'Piaui',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.textColorNormal,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Como o doleiro Chaaya Moghrabi escapou três vezes da prisão'
                                      // _parseHtmlString(
                                      //     jsonDecode(snapshot.data)["acf"]
                                      //             ["bio_resumida"]
                                      //         .toString()),
                                      ,
                                      style: TextStyle(
                                        height: 1.4,
                                        fontFamily: 'Piaui',
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).cardColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      )),
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
