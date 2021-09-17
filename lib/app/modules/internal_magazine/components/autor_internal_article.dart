import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class AutorInternalArticle extends StatelessWidget {
  const AutorInternalArticle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Container(
          height: 100,
          color: AppColors.cardColor,
          child: Row(
            children: [
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 16, bottom: 9),
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
                              'ALLAN DE ABREU ',
                              style: TextStyle(
                                height: 1.3,
                                fontFamily: 'Piaui',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.dark,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '(siga @allandeabreu1 no Twitter)',
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
                        SizedBox(height: 4),
                        Text(
                          'Repórter da piauí, é autor dos livros O Delator e Cocaína: a Rota Caipira, ambos publicados pela editora Record.',
                          style: TextStyle(
                            height: 1.4,
                            fontFamily: 'Piaui',
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dark,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
