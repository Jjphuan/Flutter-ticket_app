import 'package:flutter/material.dart';

Color primary = Colors.blue;

class AppStyle {
  static Color bgColor = const Color(0xFFeeeff2);
  static Color primaryColor = primary;
  static Color textColor = Colors.black87;
  static Color inkWellColor = const Color.fromARGB(255, 24, 95, 195);
  static Color ticketBlue = const Color.fromARGB(255, 71, 78, 173);
  static Color ticketRed = const Color.fromARGB(255, 245, 77, 77);

  static TextStyle headTextSmall =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: textColor);

  static TextStyle headTextSmaller =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor);

  static TextStyle headTextBig =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.w800);

  static TextStyle headline1 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: inkWellColor);
}
