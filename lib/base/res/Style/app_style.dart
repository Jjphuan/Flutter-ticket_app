import 'package:flutter/material.dart';

Color primary = Colors.blue;

class AppStyle {
  static Color bgColor = Color(0xFFeeeff2);
  static Color primaryColor = primary;
  static Color textColor = Colors.black87;

  static TextStyle headTextSmall = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppStyle.textColor);

  static TextStyle headTextBig =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.w800);
}
