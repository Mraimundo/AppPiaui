import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomDownLoadWidget extends StatefulWidget {
  final DownloadsController downloadsController = DownloadsController();
  RevistDownload revist;
  ButtomDownLoadWidget({Key key, this.revist}) : super(key: key);

  @override
  _ButtomDownLoadWidgetState createState() => _ButtomDownLoadWidgetState();
}

class _ButtomDownLoadWidgetState extends State<ButtomDownLoadWidget> {
  @override
  Widget build(BuildContext context) {
    double vHeight = MediaQuery.of(context).size.height;
    double vWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () async {
        await widget.downloadsController.addRevist(widget.revist);
      },
      // padding: EdgeInsets.zero,
      child: Container(
        height: vHeight * 0.06,
        width: vWidth / 8,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.orangePiaui,
          ),
        ),
        child: Align(
          child: Image.asset(
            'assets/images/arrow_download.png',
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
