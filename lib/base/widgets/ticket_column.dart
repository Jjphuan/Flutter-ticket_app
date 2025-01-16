import 'package:flutter/material.dart';
import 'package:ticket_app/base/widgets/ticket_bigText.dart';
import 'package:ticket_app/base/widgets/ticket_smallText.dart';

class TicketColumn extends StatelessWidget {
  final String toptext;
  final String bottomtext;
  final CrossAxisAlignment crossAxisAlignment;

  const TicketColumn({super.key, required this.toptext,required this.bottomtext,
                  required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TicketBigtext(text: toptext,),
        const SizedBox(height: 3,),
        TicketSmalltext(text: bottomtext)
      ],
    );
  }
}