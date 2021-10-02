// import 'package:flutter/material.dart';
// import 'package:piaui_app/app/shared/layout/colors.dart';

// class NightMode extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final double vFontSize = 15;
//     final double vBtnHeght = 5;
//     return MaterialApp(
//       child: TextButton(
//         // padding: EdgeInsets.zero,
//         onPressed: () => _notifier.value =
//             mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
//         child: ListTile(
//           contentPadding: EdgeInsets.symmetric(vertical: vBtnHeght),
//           tileColor: AppColors.appBar,
//           title: Padding(
//             padding: const EdgeInsets.only(right: 15, left: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Ativar modo noturno',
//                   style: TextStyle(
//                       fontSize: vFontSize,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.dark),
//                 ),
//                 Image.asset('assets/images/night-mode.png', scale: 0.6),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
