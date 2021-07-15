import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class InsideArticleButton extends StatefulWidget {
  @override
  _InsideArticleButtonState createState() => _InsideArticleButtonState();
}

class _InsideArticleButtonState extends State<InsideArticleButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Modular.to.pushNamed('/internal');
      },
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
                    child: Image.asset(
                      'assets/images/jogo-do-prende.png',
                      fit: BoxFit.fill,
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
              ))),
    );
  }
}
