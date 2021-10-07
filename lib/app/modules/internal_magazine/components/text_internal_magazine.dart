import 'package:flutter/material.dart';
import 'package:piaui_app/app/modules/tts/tts.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

String editAutor(List<dynamic> autor) {
  String autores = '';

  if (autor.length == 1) {
    return autor[0]["post_title"].toString().toUpperCase();
  } else if (autor.length == 2) {
    autores = autor[0]["post_title"] + ' e ' + autor[1]["post_title"];
    return autores.toUpperCase();
  } else {
    for (var i = 0; i < autor.length; i++) {
      if (i == 0) {
        autores += autor[i]["post_title"];
      } else if (i == 1) {
        autores += ', ' + autor[i]["post_title"];
      } else {
        autores += ' e ' + autor[i]["post_title"];
      }
    }
    return autores.toUpperCase();
  }
}

class TextInternalMagazine extends StatefulWidget {
  final String edition;
  final String title;
  final String data;
  final List<dynamic> autor;
  const TextInternalMagazine(
      {Key key, this.edition = "", this.title = "", this.autor, this.data})
      : super(key: key);

  @override
  _TextInternalMagazineState createState() =>
      _TextInternalMagazineState(edition, title, autor, data);
}

class _TextInternalMagazineState extends State<TextInternalMagazine> {
  String edition;
  String title;
  List<dynamic> autor;
  String data;
  _TextInternalMagazineState(this.edition, this.title, this.autor, this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Align(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Edição #' + edition,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 32),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: AppColors.internalBorderColor, width: 0.9),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: AppColors.orangePiaui,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Tts().stop();
                        }),
                    Text(
                      'anterior',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: AppColors.orangePiaui,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 32),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: AppColors.internalBorderColor, width: 0.9),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 21),
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Text(
                editAutor(autor) + ' | Edição ' + edition + ', ' + data,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              SizedBox(height: 35),
            ],
          ),
          alignment: Alignment.centerLeft),
    );
  }
}
