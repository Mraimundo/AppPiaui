import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/editions_logged_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/modules/editions_logged_page/widgets/border_top_widget.dart';
import 'package:piaui_app/app/modules/editions_logged_page/widgets/filter_widget.dart';
import 'package:piaui_app/app/modules/editions_logged_page/widgets/last_edition_widget.dart';
import 'package:piaui_app/app/modules/editions_logged_page/widgets/load_more_widget.dart';
import 'package:piaui_app/app/modules/editions_logged_page/widgets/row_grid_widget.dart';
import 'package:piaui_app/app/modules/editions_logged_page/widgets/text_has_no_signature_widget.dart';
import 'package:piaui_app/app/modules/editions_logged_page/widgets/text_to_sign_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/signature/widgets/button_to_cancel_widget.dart';
import 'package:piaui_app/app/shared/components/signature/widgets/button_to_get_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/layout/gradients.dart';

class EditionLoggedPage extends StatefulWidget {
  final String title;

  const EditionLoggedPage({Key key, this.title = "EditionPage"})
      : super(key: key);

  @override
  _EditionLoggedPageState createState() => _EditionLoggedPageState();
}

class _EditionLoggedPageState
    extends ModularState<EditionLoggedPage, EditionLoggedPageController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    children: [
                      BorderTopWidget(),
                      Container(
                        height: 42,
                        width: 400,
                        color: AppColors.appBar,
                        child: TextToSignWidget(
                          onTap: () {
                            Modular.to.pushNamed('/login');
                          },
                        ),
                      ),
                      SizedBox(height: 23),
                      TextHasNoSignatureWidget(
                        onTap: () {
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
                                            borderRadius:
                                                BorderRadius.circular(20.0),
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
                                                'Assine a piauí',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  color: AppColors.orangePiaui,
                                                ),
                                              ),
                                              SizedBox(height: 16),
                                              Align(
                                                child: Text(
                                                  'Uma revista mensal de jornalismo, ideias e humor.Assine* e tenha acesso a conteúdos exclusivos!',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors
                                                        .textColorNormal,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(height: 3),
                                              Text(
                                                '*você será redirecionado ao site da revista piauí pra finalizar a assinatura.',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color:
                                                      AppColors.textColorNormal,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Align(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.orangePiaui,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
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
                                                              text: ' R\$14,90',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: AppColors
                                                                    .textColorWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  ' no primeiro mês',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: AppColors
                                                                    .textColorBold,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ])),
                                                      Text(
                                                        'e R\$20,00 reais nos meses seguintes',
                                                      ),
                                                      SizedBox(height: 14),
                                                      Text(
                                                        'Acesso ilimitado ao site, ao aplicativo com réplica da revista e ao acervo!',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .textColorWhite,
                                                        ),
                                                      ),
                                                      SizedBox(height: 19),
                                                      Text(
                                                        'Apenas R\$14,90 no primeiro mês,',
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                width: 260,
                                                height: 235,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 19, bottom: 17),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'DIGITAL + IMPRESSO',
                                                        style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .textColorBold,
                                                        ),
                                                      ),
                                                      SizedBox(height: 12),
                                                      Text(
                                                        'Apenas 12x de 14,90',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .textColorNormal,
                                                        ),
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        'ou 8x de 24,90',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: AppColors
                                                                .textColorNormal),
                                                      ),
                                                      SizedBox(height: 14),
                                                      Text(
                                                        'Acesso ilimitado a tudo, mais a revista impressa!',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .textColorBold,
                                                        ),
                                                      ),
                                                      SizedBox(height: 19),
                                                      ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints
                                                                .tightFor(
                                                                    width: 226),
                                                        child: DecoratedBox(
                                                          decoration: BoxDecoration(
                                                              gradient:
                                                                  AppGradients
                                                                      .linear),
                                                          child: TextButton(
                                                            child: Text(
                                                              'ASSINE AGORA',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .textColorWhite,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Modular.to.pushNamed(
                                                                  '/magazine');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 18),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          'Você pode cancelar a qualquer hora',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: AppColors
                                                                .textColorBlack,
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
                          // Modular.to.pushNamed('/signature');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 21, right: 30, left: 30, bottom: 25),
                        child: BorderTopWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        child: FilterWidget(),
                      ),
                      LastEditionWidget(),
                      RowGridWidget(),
                      LoadMoreWidget(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
