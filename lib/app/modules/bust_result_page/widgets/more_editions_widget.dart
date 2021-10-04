import 'package:flutter/cupertino.dart';

class MoreEditionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 80,
            // color: AppColors.appBackground,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                child: Text(
                  'MAIS EDIÇÕES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
