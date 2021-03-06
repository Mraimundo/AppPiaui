import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/shared/components/about_us/widgets/app_bar_default_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/controller/configuration_controller.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class AboutUsPage extends StatefulWidget {
  final String title;
  const AboutUsPage({Key key, this.title = "Config"}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends ModularState<AboutUsPage, ConfigController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final double vFontSize = 18;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(76),
          child: SafeArea(
            top: true,
            child: AppBarDefaultWidget(),
          ),
        ),
        body: Stack(
          children: [
            LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 18),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                    'assets/images/arrow-left.png',
                                    scale: 1.4),
                              ),
                              Text(
                                'Voltar para menu',
                                style: TextStyle(
                                    fontSize: vFontSize,
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Sobre N??s',
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: AppColors.orangePiaui,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'A REVISTA',
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 22, right: 20, top: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'A piau?? ?? uma revista mensal de jornalismo, ideias e humor.',
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: Text(
                            'Publicamos para quem gosta de ler. Vale praticamente qualquer tema. Pol??tica, literatura, economia, televis??o, arquitetura, cinema, futebol, odontologia ??? contanto que o dentista seja interessante, ou o tratamento de canal, revolucion??rio.',
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              fontSize: 16,
                              height: 1.4,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                            )),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: Text(
                            'Jornalistas, escritores, artistas gr??ficos, ensa??stas, cr??ticos e humoristas detodas as idades expressam em piau?? diferentes aspectos da vida nacional, que, convenhamos, n??o anda f??cil de ser compreendida. Numa situa????o como essa, ?? melhor admitir a perplexidade do que prescrever receitasinfal??veis de salva????o. N??o salvamos ningu??m, estamos perplexos, mas somos muito curiosos.',
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              fontSize: 16,
                              height: 1.4,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                            )),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: Text(
                            'Nossa curiosidade, aliada ?? nossa certeza de que ?? dif??cil ter certeza, nos afasta da seriedade taxativa de quem tem causas a defender e bandeiras a empunhar. Preferimos desconfiar de quem n??o tem d??vida, e achamos que um pouco de ceticismo n??o faz mal a ningu??m ??? e a nenhuma revista. ',
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                            )),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'piau?? n??o tem resposta para nada. Nem para quem pergunta por que ela se chama piau??, porque a esse respeito ainda n??o chegamos a um consenso (existem pelo menos quatro vers??es).',
                            style: TextStyle(
                              fontFamily: 'TradeGothic',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22, right: 22, bottom: 22),
                        child: Text(
                            'Gostamos de imaginar que somos uma revista serena, que d?? tempo a seus jornalistas para que trabalhem, e que isso n??o ?? sin??nimo de lentid??o, mas de apuro. Talvez tenhamos sido influenciados pelas nossas leituras de crian??a, quando aprendemos que nem sempre a lebre vence a corrida. Com nosso passo cuidadoso, j?? chegamos na frente v??rias vezes. Muitos temas que se transformaram na manchete dos jornais apareceram antes em piau??.',
                            style: TextStyle(
                                fontFamily: 'TradeGothic',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ));
  }
}
