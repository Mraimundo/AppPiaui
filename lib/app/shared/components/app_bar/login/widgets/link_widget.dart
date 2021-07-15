import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  final VoidCallback onTap;
  const LinkWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            'sac.abril.com.br',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
