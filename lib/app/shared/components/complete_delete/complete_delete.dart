import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/modules/all_editions_page/view/all_edition_page.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Future<Dados> readUser() async {
  Dados user = new Dados();
  user = Dados.fromJson(await FlutterSession().get("user"));
  return user;
}

class CompleteDelete extends StatefulWidget {
  String id;
  String numberEdition;
  String year;
  String month;
  DownloadsController downloads = DownloadsController();

  CompleteDelete(this.id, this.numberEdition, this.year, this.month);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CompleteDeleteState();
  }
}

class CompleteDeleteState extends State<CompleteDelete> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black54,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 350,
                    height: 230,
                    color: Theme.of(context).backgroundColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Aviso',
                            style: TextStyle(
                              color: AppColors.orangePiaui,
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: 300,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Deseja excluir a ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Edição #' +
                                                widget.numberEdition
                                                    .toString() +
                                                ': ' +
                                                widget.month +
                                                ' de ' +
                                                widget.year,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: ' ?'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  await widget.downloads
                                      .deleteRevist(widget.id);
                                  Dados user = new Dados();
                                  user = await readUser();

                                  /*  Navigator.of(context).pop(); */
                                  /* Modular.to.pushNamedAndRemoveUntil('/logged' arguments: z
                                     (Route<dynamic> route) => false); */

                                  /* Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AllEditionPage(user: user)),
                                      (route) => false); */
                                },
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  color: AppColors.orangePiaui,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Excluir',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColorWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.orangePiaui,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.orangePiaui),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
  }
}
