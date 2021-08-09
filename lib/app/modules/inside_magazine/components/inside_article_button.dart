import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/model/subjects_model.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';

class InsideArticleButton extends StatefulWidget {
  @override
  _InsideArticleButtonState createState() => _InsideArticleButtonState();
}

class _InsideArticleButtonState
    extends ModularState<InsideArticleButton, InsideMagazineController> {
  @override
  void initState() {
    super.initState();
    controller.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Modular.to.pushNamed('/internal');
      },
      child: _makeListSubjects(),

      // child: FutureBuilder<List<SubjectModel>>(
      //   future: controller.subjectsFuture,
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //         break;
      //       case ConnectionState.done:
      //         if (snapshot.hasData) {
      //           return _makeListSubjects(snapshot.data);
      //         } else {
      //           return Container();
      //         }
      //         break;
      //       default:
      //         return Container();
      //     }
      //   },
      // ),
    );
  }

  // (List<SubjectModel>data),

  Card _makeListSubjects() {
    return Card(
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
    );
  }
}
