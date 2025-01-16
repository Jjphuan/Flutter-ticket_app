import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class TicketBigtext extends StatelessWidget {
  final String text;

  const TicketBigtext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppStyle.headTextSmall.copyWith(color: Colors.white));
  }
}
