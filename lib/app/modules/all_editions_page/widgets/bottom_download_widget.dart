import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/downloads/download_revist.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/downloads/model/revist_download.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomDownLoadWidget extends StatefulWidget {
  final DownloadsController downloadsController = DownloadsController();
  final DownloadRevist downloadRevist = DownloadRevist();
  final int id;
  dynamic capa, numberEdition, mes, ano;
  ButtomDownLoadWidget(
      {Key key, this.id, this.capa, this.numberEdition, this.mes, this.ano})
      : super(key: key);

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
        widget.downloadRevist.download(
          widget.id,
          widget.capa,
          widget.numberEdition,
          widget.mes,
          widget.ano,
        );
      },
      // padding: EdgeInsets.zero,
      child: Container(
        height: vHeight * 0.06,
        width: vWidth / 8,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.backgroundColorLastEdition,
          ),
        ),
        child: Align(
          child: Image.asset(
            'assets/images/icon_download.png',
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
