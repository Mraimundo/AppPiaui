import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/signature/controller/signature_controller.dart';
import 'package:piaui_app/app/shared/components/signature/widgets/button_to_cancel_widget.dart';
import 'package:piaui_app/app/shared/components/signature/widgets/button_to_get_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/layout/gradients.dart';

class SignaturePage extends StatefulWidget {
  final String title;
  const SignaturePage({Key key, this.title = "Signature", this.onTap})
      : super(key: key);
  final VoidCallback onTap;

  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState
    extends ModularState<SignaturePage, SignatureController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    // final double vFontSize = 15;
    // final double vBtnHeght = 5;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 65),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Container(
          child: TextButton(
            child: Text(''),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      child: SingleChildScrollView(
                        child: Stack(children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.only(
                                top: 22,
                                right: 30,
                                left: 30,
                                bottom: 22,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Assine a piau??',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: AppColors.orangePiaui,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Align(
                                    child: Text(
                                      'Uma revista mensal de jornalismo, ideias e humor.Assine* e tenha acesso a conte??dos exclusivos!',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textColorNormal,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '*voc?? ser?? redirecionado ao site da revista piau?? pra finalizar a assinatura.',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.textColorNormal,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Align(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.orangePiaui,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      padding: EdgeInsets.only(
                                        top: 18,
                                        right: 30,
                                        left: 30,
                                        bottom: 22,
                                      ),
                                      width: 260,
                                      height: 235,
                                      child: Column(
                                        children: [
                                          Text(
                                            'DIGITAL',
                                            style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 13),
                                          Text.rich(TextSpan(
                                              text: 'Apenas',
                                              children: [
                                                TextSpan(
                                                  text: ' R\$ 14,90  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .textColorWhite,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '   no primeiro m??s',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color:
                                                        AppColors.textColorBold,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ])),
                                          Text(
                                            'e R\$20,00 reais nos meses seguintes',
                                          ),
                                          SizedBox(height: 14),
                                          Align(
                                            child: Center(
                                              child: Text(
                                                'Acesso ilimitado ao site, ao aplicativo com r??plica da revista e ao acervo!',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      AppColors.textColorWhite,
                                                ),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(height: 19),
                                          Text(
                                            'Apenas R\$14,90 no primeiro m??s,',
                                          ),
                                        ],
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(height: 19),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.boxColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    width: 260,
                                    height: 235,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 19, bottom: 17),
                                      child: Column(
                                        children: [
                                          Text(
                                            'DIGITAL + IMPRESSO',
                                            style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColorBold,
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            'Apenas 12x de R\$14,90',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColorNormal,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'ou 8x de R\$24,90',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color:
                                                    AppColors.textColorNormal),
                                          ),
                                          SizedBox(height: 14),
                                          Text(
                                            'Acesso ilimitado a tudo, mais a revista impressa!',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.textColorBold,
                                            ),
                                          ),
                                          SizedBox(height: 19),
                                          ConstrainedBox(
                                            constraints:
                                                BoxConstraints.tightFor(
                                                    width: 226),
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      AppGradients.linear),
                                              child: TextButton(
                                                child: Text(
                                                  'ASSINE AGORA',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors
                                                        .textColorWhite,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Modular.to
                                                      .pushNamed('/magazine');
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 18),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Voc?? pode cancelar a qualquer hora',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: AppColors.textColorBlack,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 22),
                                  Column(
                                    children: [
                                      ButtonToGetWidget(),
                                      SizedBox(height: 22),
                                      ButtonToCancelWidget(),
                                    ],
                                  ),
                                ],
                              ) // height: 250,
                              ),
                        ]),
                      ),
                    );
                  });
            },
          ),
        ),
        // child: RaisedButton(
        //   onPressed: () {

        //     // Modular.to.pushNamed('/signature');
        //   },
        // ),
      ),
    );
  }
}
