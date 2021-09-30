import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/api/google_sign_in_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:piaui_app/app/modules/all_editions_page/view/all_edition_page.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/controller/login_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/back_to_home_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/link_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/login_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/reset_to_password_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/signature_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/social_login_button.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/widgets/text_login_widget.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/core/custom_dio.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:piaui_app/app/shared/layout/gradients.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> populateUser(user) async {
  await FlutterSession().set("user", user);
}

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  _launchURL() async {
    const url = 'https://piaui.homolog.inf.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredAppBarWidget(height: 56),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackToHomeWidget(
              onTap: () {
                Modular.to.pushNamed('/editions');
              },
            ),
            TextLoginWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Container(
                alignment: Alignment.topLeft,
                child: SocialLoginButton(
                  onTap: () {
                    signIn(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, right: 20, left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginWidget(),
                  SizedBox(height: 20),
                  ResetToPassWordWidget(onTap: () {}),
                  Column(
                    children: [
                      Align(
                        child: Text(
                          'Ainda não tem cadastro?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SignatureWidget(
                        onTap: () {
                          _launchURL();
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Assinante piauí:',
                          style: TextStyle(
                            fontFamily: 'Piaui',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColorNormal,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' faça o login usando o e-mail e senha cadastrados no site.',
                          style: TextStyle(
                            fontFamily: 'Piaui',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColorNormal,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  LinkWidget(
                    onTap: () {
                      Modular.to.pushNamed('/signature');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future signIn(BuildContext context) async {
  var user;
  try {
    user = await GoogleSignInApi.login();

    var _inpLogin = user.email;
    var _inpSenha = user.id;

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in failed')));
    } else {
      final _url = '/wp-admin/admin-ajax.php?action=flLogin';
      var dio = CustomDio().instance;
      try {
        var _data;
        var response;
        var json;

        _data =
            FormData.fromMap({'inpLogin': _inpLogin, 'inpSenha': _inpSenha});

        response = await dio.post(_url, data: _data);
        json = jsonDecode(response.data);

        try {
          var userDados = Dados.fromMap(jsonDecode(response.data)["dados"]);
          populateUser(userDados);
          var assinante = json['dados']['assinante'];

          if (assinante == '1') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => AllEditionPage(user: userDados),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(
                child: Text('Você não é assinante!'),
              ),
            ));
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Center(
              child: Text(json['msg']),
            ),
          ));
        }
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            child: Column(
              children: [
                Text('Falha ao fazer login'),
                Text(e.toString()),
              ],
            ),
          ),
        ));
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
        child: Column(
          children: [
            Text('Falha ao fazer login'),
            Text(e.toString()),
          ],
        ),
      ),
    ));
  }
}
