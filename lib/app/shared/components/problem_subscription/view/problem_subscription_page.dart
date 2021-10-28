import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/controller/configuration_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ProblemSubscriptionPage extends StatefulWidget {
  final String title;
  const ProblemSubscriptionPage({Key key, this.title = "Config"})
      : super(key: key);

  @override
  _ProblemSubscriptionPageState createState() =>
      _ProblemSubscriptionPageState();
}

class _ProblemSubscriptionPageState
    extends ModularState<ProblemSubscriptionPage, ConfigController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final double vFontSize = 18;
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 18),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child:
                        Image.asset('assets/images/arrow-left.png', scale: 1.5),
                  ),
                  Text(
                    'Voltar para menu',
                    style: TextStyle(
                        fontSize: vFontSize,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Problema com a minha assinatura',
                style: TextStyle(
                  fontFamily: 'TradeGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orangePiaui,
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 8),
            child: Text(
              'Caso você esteja tendo problemas com a sua assinatura entre em contato com a equipe da revista piauí que iremos lhe ajudar:',
              style: TextStyle(
                  fontFamily: 'TradeGothic',
                  fontSize: 14,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 16),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Envie um e-mail detalhando o seu problema para  ',
                    style: TextStyle(
                      fontFamily: 'TradeGothic',
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'assinaturadigital@revistapiaui.com.br',
                    style: TextStyle(
                      fontFamily: 'TradeGothic',
                      fontSize: 16,
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orangePiaui,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
