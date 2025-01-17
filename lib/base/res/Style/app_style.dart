import 'package:flutter/material.dart';

Color primary = const Color.fromARGB(255, 42, 126, 194);

class AppStyle {
  static Color bgColor = const Color.fromARGB(255, 233, 232, 232);
  static Color primaryColor = primary;
  static Color textColor = Colors.black87;
  static Color inkWellColor = const Color.fromARGB(255, 24, 95, 195);
  static Color ticketBlue = const Color.fromARGB(255, 71, 78, 173);
  static Color ticketRed = const Color.fromARGB(255, 245, 77, 77);
  static Color iconColor = const Color.fromARGB(255, 159, 159, 159);

  static TextStyle headTextSmall =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: textColor);

  static TextStyle headTextSmaller =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor);

  static TextStyle headTextBig =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.w800);

  static TextStyle headline1 =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: inkWellColor);
}
