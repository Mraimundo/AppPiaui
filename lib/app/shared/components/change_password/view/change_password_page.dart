import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/components/app_bar/configuration/controller/configuration_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/preferred_app_bar_widget.dart';
import 'package:piaui_app/app/shared/components/change_password/widgets/border_top_widget.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Future<String> readUser() async {
  return await FlutterSession().get("user");
}

class ChangePasswordPage extends StatefulWidget {
  final String title;
  const ChangePasswordPage({Key key, this.title = "Config"}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState
    extends ModularState<ChangePasswordPage, ConfigController> {
  //use 'controller' variable to access controller

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    final double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<String>(
        future: readUser(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print(jsonDecode(snapshot.data));
            return Scaffold(
              appBar: PreferredAppBarWidget(
                height: 56,
                close: true,
              ),
              backgroundColor: AppColors.backgroundColor,
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
                            child: Image.asset('assets/images/arrow-left.png',
                                scale: 0.9),
                          ),
                          Text(
                            'Voltar para menu',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.dark),
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
                        'Minha conta',
                        style: TextStyle(
                          fontFamily: 'TradeGothic',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      'Nome Completo',
                      style: TextStyle(
                          fontFamily: 'TradeGothic',
                          fontSize: 14,
                          color: AppColors.dark),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Form(
                      // key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.06,
                            width: size.width / 1.10,
                            // margin: EdgeInsets.all(10),
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: AppColors
                                    .borderColorForm, // set border color
                                width: 0.8,
                              ), // set border width
                              // set rounded corner radius
                            ),
                            child: Align(
                              child: TextFormField(
                                enabled: false,
                                initialValue: jsonDecode(snapshot.data)["nome"],
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) => setState(() {
                                  // _inpLogin = value ?? 'Email';
                                }),
                                decoration: InputDecoration(
                                  hintText: 'Nome',
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  // if (!validateEmail(value)) {
                                  //   return 'Por favor use um email valido';
                                  // }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  fontFamily: 'TradeGothic',
                                  fontSize: 14,
                                  color: AppColors.dark),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: size.height * 0.06,
                            width: size.width / 1.10,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: AppColors
                                    .borderColorForm, // set border color
                                width: 0.8,
                              ), // set border width
                              // set rounded corner radius
                            ),
                            child: TextFormField(
                                enabled: false,
                                initialValue:
                                    jsonDecode(snapshot.data)["email"],
                                autocorrect: false,

                                // onChanged: (value) => setState(() {
                                //       _inpSenha = value ?? 'Senha';
                                //     }),
                                decoration: InputDecoration(
                                  hintText: 'Senha',
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 6) {
                                    return 'A senha deve ter ao menos 6 caracteres';
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(height: 13),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 22, right: 22),
                    child: BorderTopWidget(),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
