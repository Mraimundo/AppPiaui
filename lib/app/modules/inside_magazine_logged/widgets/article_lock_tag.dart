import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ArticleLockTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        height: 35,
        width: 160,
        color: AppColors.orangePiaui,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Matéria fechada',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.lock_outline,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
