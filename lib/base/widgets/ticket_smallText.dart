import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';

class TicketSmalltext extends StatelessWidget {
  final String text;
  final TextAlign align;
  final bool isColor;

  const TicketSmalltext(
      {super.key, required this.text, this.align = TextAlign.start,this.isColor=true});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        style: AppStyle.headTextSmaller.copyWith(
          color: isColor == true ? Colors.white:Colors.black,
        ));
  }
}
