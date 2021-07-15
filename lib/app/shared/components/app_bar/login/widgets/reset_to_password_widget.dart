import 'package:flutter/material.dart';

class ResetToPassWordWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ResetToPassWordWidget({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(
          'Esqueceu sua senha?',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
