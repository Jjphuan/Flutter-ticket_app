import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';

class TicketBigtext extends StatelessWidget {
  final String text;
  final bool isColor;

  const TicketBigtext({super.key, required this.text,this.isColor=true});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppStyle.headTextSmall.copyWith(
          color: isColor == true ? Colors.white: Colors.black,
           fontSize: 16)
          );
  }
}
