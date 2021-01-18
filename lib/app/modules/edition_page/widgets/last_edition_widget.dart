import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class LastEditionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 630,
              color: AppColors.appBackground,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                        child: Container(
                          color: Colors.red,
                          height: 420,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Container(
                          color: Colors.white,
                          height: 60,
                          child: Align(
                            child: Text('Edição #172: Janeiro de 2021'),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                        child: Container(
                          color: AppColors.bottomAppBar,
                          height: 60,
                          child: Align(
                            child: Text(
                              'Ler revista agora',
                              style: TextStyle(color: Colors.white),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
