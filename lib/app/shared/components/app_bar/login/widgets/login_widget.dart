import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/auth/auth_controller.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/model/auth_user.dart';
import 'package:piaui_app/app/shared/components/app_bar/login/util/validations.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

Future<void> populateUser(user) async {
  await FlutterSession().set("user", user);
}

class LoginWidget extends StatefulWidget {
  // final UserModel use;

  const LoginWidget({
    Key key,
    this.onLoginSuccess,
  }) : super(key: key);

  final String onLoginSuccess;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  var _inpLogin = '';
  var _inpSenha = '';

  final authController = AuthController();

  Future<void> _onPressed() async {
    final _url =
        'http://piaui.homolog.inf.br/wp-admin/admin-ajax.php?action=flLogin';
    var dio = Dio();
    try {
      final _data =
          FormData.fromMap({'inpLogin': _inpLogin, 'inpSenha': _inpSenha});
      var response = await dio.post(_url, data: _data);
      var json = jsonDecode(response.data);
      try {
        var user = Dados.fromMap(jsonDecode(response.data)["dados"]);

        await populateUser(user);
        authController.setUser(context, user);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            child: Text(json['msg']),
          ),
        ));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.toString());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            child: Text(e.message),
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(
          child: Text(e.toString()),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return Material(
        child: Container(
      color: AppColors.backgroundColor,
      height: vHeight * 0.28,
      width: vWidth / 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: vHeight * 0.06,
                width: vWidth / 1.10,
                // margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.borderColorForm, // set border color
                    width: 0.8,
                  ), // set border width
                  // set rounded corner radius
                ),
                child: Align(
                  child: TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => setState(() {
                      _inpLogin = value ?? 'Email';
                    }),
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (!validateEmail(value)) {
                        return 'Por favor use um email valido';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: vHeight * 0.06,
                width: vWidth / 1.10,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.borderColorForm, // set border color
                    width: 0.8,
                  ), // set border width
                  // set rounded corner radius
                ),
                child: TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    onChanged: (value) => setState(() {
                          _inpSenha = value ?? 'Senha';
                        }),
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
              SizedBox(
                height: 13,
              ),
              Container(
                margin: EdgeInsets.only(left: 0),
                child: TextButton(
                  // onPressed: () {},
                  child: Container(
                    color: AppColors.orangePiaui,
                    height: vHeight * 0.06,
                    width: vWidth / 2.5,
                    child: Align(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  onPressed: () => _onPressed(),
                  // loading: _isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
