import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.internalBorderColor,
        ),
      ),
      // child: DateTimePicker(),
    );
  }
}
