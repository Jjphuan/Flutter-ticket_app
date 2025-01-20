import 'package:flutter/material.dart';

class BigDot extends StatelessWidget {
  final bool isColor;

  const BigDot({super.key,this.isColor=true});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(color: isColor == true ? Colors.white: Colors.black, width: 2.5),
            borderRadius: BorderRadius.circular(20)
        ),
    );
  }
}