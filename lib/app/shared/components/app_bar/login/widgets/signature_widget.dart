import 'package:flutter/material.dart';

class SignatureWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SignatureWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        child: Text(
          'Assine agora!',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color.fromRGBO(241, 91, 64, 1.0),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
