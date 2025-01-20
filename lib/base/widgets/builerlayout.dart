import 'package:flutter/material.dart';

class BuilderLayout extends StatelessWidget {
  final int randomDivider;
  final double width;
  final bool isColor;

  const BuilderLayout({super.key, required this.randomDivider, this.width=3,this.isColor=true});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            (constraints.constrainWidth() / randomDivider).floor(),
            (index) => SizedBox(
                  width: width,
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: isColor == true ? Colors.white: Colors.black,)),
                )),
      );
    });
  }
}
