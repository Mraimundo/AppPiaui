import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';

Future<dynamic> readUser() async {
  return await FlutterSession().get("user");
}

Future<String> materias(url) async {
  final _url = url;
  var dio = Dio();
  var response = await dio.get(_url);
  return response.toString();
}

class InsideArticleButton extends StatefulWidget {
  final String url;
  final String id;
  final String idMateria;
  final String user;

  const InsideArticleButton(
      {Key key,
      this.url = "Testes",
      this.id,
      this.idMateria = "",
      this.user = ""})
      : super(key: key);
  @override
  _InsideArticleButtonState createState() =>
      _InsideArticleButtonState(idMateria, user, url);
}

class _InsideArticleButtonState
    extends ModularState<InsideArticleButton, InsideMagazineController> {
  String idMateria;
  var user;
  var teste;
  String url;

  _InsideArticleButtonState(this.idMateria, this.user, this.url);

  @override
  void initState() {
    super.initState();
    controller.findAll();
  }

  /* @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (user == "") {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Usuário não está logado')));
          Modular.to.pushNamed('/login');
        } else {
          Modular.to.pushNamed('/internal');
        }
      },
      child: _makeListSubjects(user, url),
    );
  } */

  @override
  Widget build(context) {
    return FutureBuilder<String>(
        future: materias(url),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return TextButton(
              onPressed: () async {
                if (user == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuário não está logado')));
                  Modular.to.pushNamed('/login');
                } else {
                  Modular.to.pushNamed('/internal');
                }
              },
              child: _makeListSubjects(user, snapshot.data),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  // (List<SubjectModel>data),

  Card _makeListSubjects(String user, String url) {
    print((jsonDecode(url)["materias"]['1']).length);
    var list = [
      "João Campos, o jovem prefeito do Recife, e os dramas agrestes de uma dinastia política",
      "Flávio Bolsonaro e o roubo de 6,1 milhões de reais de dinheiro público",
      "A nova política é como o vinho, quanto mais velha melhor"
    ];
    var titulo = [
      "O herdeiro",
      "A Orcrim-FB",
      "A nova política é como o vinho, quanto mais velha melhor"
    ];
    var imagem = [
      "https://piaui.homolog.inf.br/wp-content/uploads/2021/03/175_vultosdarepublica.jpg",
      "https://piaui.homolog.inf.br/wp-content/uploads/2021/03/175_questoescriminais.jpg",
      "https://piaui.homolog.inf.br/wp-content/uploads/2021/03/175_humor.jpg"
    ];

    return Card(
      elevation: 0,
      child: Container(
        color: AppColors.cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                color: Colors.black.withOpacity(0.9),
                child: Container(
                  child: Image.asset(
                    'assets/images/agora.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: user != ""
                    ? Text("")
                    : Image.asset("assets/images/fechado.png"),
              )
            ]),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            titulo[int.parse(idMateria)].toString().length < 30
                                ? titulo[int.parse(idMateria)].toString()
                                : titulo[int.parse(idMateria)]
                                        .toString()
                                        .substring(0, 30) +
                                    "...",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orangePiaui,
                            ),
                            // maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        Image.asset(
                          'assets/images/arrow.png',
                          // fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(list[int.parse(idMateria)].toString(),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textColorArticle,
                        ),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
