import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ArticleButton extends StatefulWidget {
  @override
  _ArticleButtonState createState() => _ArticleButtonState();
}

class _ArticleButtonState extends State<ArticleButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Card(
          elevation: 0,
          child: Container(
              width: 316,
              height: 70,
              color: AppColors.cardColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 0,
                    child: Image.asset(
                      'assets/images/jogo-do-prende.png',
                      width: 70,
                      height: 70,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '01. O JOGO DO PRENDE-E-SOLTA',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Image.asset(
                                  'assets/images/arrow.png',
                                  // fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                                'Como o doleiro Chaaya Moghrabi escapou três vezes da prisão',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
