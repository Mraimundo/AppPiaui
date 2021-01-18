import 'package:flutter/material.dart';

class RowGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double rowHeight = 250;
    final double rowWidth = 205;
    final double rowFontsize = 11;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                    child: Container(
                      color: Colors.white,
                      height: rowHeight,
                      width: rowWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.red,
                            height: rowHeight * 0.80,
                            width: rowWidth * 0.85,
                          ),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.85,
                            child: Align(
                              child: Text(
                                'Edição #171: Dezembro de 2020',
                                style: TextStyle(fontSize: rowFontsize),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 16, 8),
                    child: Container(
                      color: Colors.white,
                      height: rowHeight,
                      width: rowWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.red,
                            height: rowHeight * 0.80,
                            width: rowWidth * 0.85,
                          ),
                          Container(
                            color: Colors.white,
                            height: rowHeight * 0.15,
                            width: rowWidth * 0.85,
                            child: Align(
                              child: Text(
                                'Edição #170: Novembro de 2020',
                                style: TextStyle(fontSize: rowFontsize),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
