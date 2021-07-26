import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class SelectEditionWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SelectEditionWidget({Key key, this.onTap})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: Row(
              children: [
                Text(
                  'Selecione a edição',
                  style: TextStyle(
                    height: 1.3,
                    fontFamily: 'Palatino',
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orangePiaui,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
