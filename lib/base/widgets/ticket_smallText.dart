import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class TicketSmalltext extends StatelessWidget {
  final String text;
  final TextAlign align;

  const TicketSmalltext({super.key, required this.text,this.align=TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: align,
        style: AppStyle.headTextSmaller.copyWith(color: Colors.white,));
  }
}
