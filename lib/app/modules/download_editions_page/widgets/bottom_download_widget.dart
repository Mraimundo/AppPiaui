import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:piaui_app/app/modules/download_editions_page/controller/edition_page_controller.dart';
import 'package:piaui_app/app/shared/components/complete_delete/complete_download.dart';
import 'package:piaui_app/app/shared/downloads/downloads_controller.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ButtomDownLoadWidget extends StatefulWidget {
  final DownloadsController downloads = DownloadsController();
  String id;
  String numberEdition;
  String month;
  String year;
  ButtomDownLoadWidget(
      {Key key, this.id, this.numberEdition, this.month, this.year})
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
        await widget.downloads.deleteRevist(widget.id);
        showDialog(
            context: context,
            builder: (contex) {
              return CompleteDelete(
                  widget.numberEdition.toString(), widget.year, widget.month);
            });
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
            'assets/images/config.png',
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
