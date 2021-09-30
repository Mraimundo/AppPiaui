import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class InsideMaterialClose extends StatefulWidget {
  @override
  _InsideMaterialCloseState createState() => _InsideMaterialCloseState();
}

class _InsideMaterialCloseState extends State<InsideMaterialClose> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Card(
              elevation: 0,
              child: Container(
                  width: 315,
                  height: 70,
                  color: AppColors.cardColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Container(
                          color: Colors.black.withOpacity(0.9),
                          child: Expanded(
                            flex: 2,
                            child: Image.asset(
                              'assets/images/agora.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Image.asset('assets/images/fechado.png'),
                        ),
                      ]),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '01. O JOGO DO PRENDE-E-SOLTA',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.orangePiaui,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/arrow.png',
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),
                              Text(
                                  'Como o doleiro Chaaya Moghrabi escapou três vezes da prisão',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.textColorArticle,
                                  ),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
