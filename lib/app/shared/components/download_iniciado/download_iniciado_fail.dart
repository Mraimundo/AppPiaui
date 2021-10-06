import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class DonwloadIniciadoFail extends StatefulWidget {
  DonwloadIniciadoFail();
  @override
  _DonwloadIniciadoState createState() => _DonwloadIniciadoState();
}

class _DonwloadIniciadoState extends State<DonwloadIniciadoFail> {
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
                            'Aviso!',
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
                                      text: 'Você já tem essa revista baixada!',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                      ),
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
                                      'Ok',
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
