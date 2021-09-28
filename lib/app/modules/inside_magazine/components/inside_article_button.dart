import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller_materia/controller_materia.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/modules/inside_magazine/controller/inside_magazine_controller.dart';

class InsideArticleButton extends StatefulWidget {
  final String url;
  final String id;
  const InsideArticleButton({Key key, this.url, this.id}) : super(key: key);
  @override
  _InsideArticleButtonState createState() => _InsideArticleButtonState();
}

class _InsideArticleButtonState extends State<InsideArticleButton> {
  // final MateriaController controller = MateriaController();

  @override
  // void initState() {
  //   controller.getAllMaterias();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      Modular.to.pushNamed('/internal');
    }, child: ValueListenableBuilder(
            // valueListenable: controller.allMaterias,
            builder: (_, value, __) {
      return Card(
        elevation: 0,
        // final Materiamodel materias = value;
        child: Container(
          color: AppColors.cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Image.asset('', fit: BoxFit.fill),
                  // child: Image.asset('assets/images/jogo-do-prende.png',
                  // fit: BoxFit.fill),
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
    })

        // child: _makeListSubjects(),

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

  // Card _makeListSubjects() {
  //   ValueListenableBuilder(
  //       valueListenable: controller.allMaterias,
  //       builder: (_, value, _) {
  //         return Card(
  //     elevation: 0,
  //     child: Container(
  //       color: AppColors.cardColor,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Expanded(
  //             flex: 2,
  //             child: Container(
  //               child: Image.asset('assets/images/jogo-do-prende.png',
  //                   fit: BoxFit.fill),
  //             ),
  //           ),
  //           Expanded(
  //             flex: 6,
  //             child: Container(
  //               padding: const EdgeInsets.all(12),
  //               child: Column(
  //                 // mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         '01. O JOGO DO PRENDE-E-SOLTA',
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.bold,
  //                           color: AppColors.orangePiaui,
  //                         ),
  //                         // maxLines: 2,
  //                       ),
  //                       Image.asset(
  //                         'assets/images/arrow.png',
  //                         // fit: BoxFit.fill,
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(height: 3),
  //                   Text(
  //                       'Como o doleiro Chaaya Moghrabi escapou três vezes da prisão',
  //                       style: TextStyle(
  //                         fontSize: 13,
  //                         fontWeight: FontWeight.normal,
  //                         color: AppColors.textColorArticle,
  //                       ),
  //                       overflow: TextOverflow.ellipsis),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //       });
  // }
}
