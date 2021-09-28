import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller_materia/controller_materia.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller_materia/teste_controller.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/materia_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/teste_model.dart';
import 'package:piaui_app/app/modules/inside_magazine/repository/inside_repository.dart';
import 'package:piaui_app/app/modules/inside_magazine/repository_teste/inside_repository.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';

class InsideMaterial extends StatefulWidget {
  final int index;
  final String url;
  final String id;
  const InsideMaterial({Key key, this.url, this.id, this.index})
      : super(key: key);
  @override
  _InsideMaterialState createState() => _InsideMaterialState();
}

class _InsideMaterialState
    extends ModularState<InsideMaterial, InsideMagazineController> {
  // final Future<materiaModel> futureMateria;

  @override
  void initState() {
    super.initState();
    // futureMateria = getMateria();
  }
  // materiaModel materia;
  // bool _isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  //   getMaterias();
  // }

  // Future<void> getMaterias() async {
  //   // _materia = await MateriaRepository.findAllMateria;
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   print(_materia);
  // }

  @override
  Widget build(BuildContext context) {
    // materiaModel subjects = controller.editionsSinglePage[widget.index];
    // materiaModel allMatters = controller.editionsSinglePage[widget.index];
    // print(subjects);
    return TextButton(onPressed: () {
      Modular.to.pushNamed('/internal');
    }, child: FutureBuilder<materiaModel>(
        // future: futureMateria,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        // Data userData = userInfo.data;
        return ListView.builder(
          // itemCount: controller.allMaterias,
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => Container(
            // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              elevation: 0,
              child: Container(
                color: AppColors.cardColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        // child: Image.network(allMatters.imagemcapa.url),
                        child: Image.asset('assets/images/jogo-do-prende.png',
                            fit: BoxFit.fill),
                      ),
                    ),
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
                                  '01. O JOGO DO PRENDE-E-SOLTA',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orangePiaui,
                                  ),
                                  // maxLines: 2,
                                ),
                                Image.asset(
                                  'assets/images/arrow.png',
                                  // fit: BoxFit.fill,
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(
                                'Como o doleiro Chaaya Moghrabi escapou três vezes da prisão',
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
            ),
          ),
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.hasError}');
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }));
  }
}
