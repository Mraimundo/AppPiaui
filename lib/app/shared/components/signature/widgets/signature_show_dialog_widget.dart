import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/components/signature/view/signature_page.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class SignatureShowDialogWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SignatureShowDialogWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 20,
          color: AppColors.orangePiaui,
        ));
  }
}
