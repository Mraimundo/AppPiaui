import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black54,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 238,
                  color: AppColors.textColorWhite,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'Pesquisa',
                          style: TextStyle(
                            color: AppColors.orangePiaui,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: 315,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.orangePiaui,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  obscureText: false,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: "Escreva sua busca aqui ...",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.orangePiaui,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Fechar',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.orangePiaui,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                height: 60,
                                width: 150,
                                color: AppColors.orangePiaui,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'BUSCAR',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
