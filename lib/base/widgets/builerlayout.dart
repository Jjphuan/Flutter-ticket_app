import 'package:flutter/material.dart';

class BuilderLayout extends StatelessWidget {
  final int randomDivider;

  const BuilderLayout({super.key,required this.randomDivider});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context , BoxConstraints constraints){
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          (constraints.constrainWidth()/randomDivider).floor(), 
          (index) => SizedBox(
            width: 6,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white
              )
            ),
          )),
      );
    });
  }
}
