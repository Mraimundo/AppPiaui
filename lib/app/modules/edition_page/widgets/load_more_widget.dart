import 'package:flutter/material.dart';

class LoadMoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 80,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                child: Text('Carregar mais'),
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
