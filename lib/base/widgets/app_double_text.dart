import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class AppDoubleText extends StatelessWidget {
  const AppDoubleText(
      {Key? key, required this.bigText, required this.smallText})
      : super(key: key);

  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(bigText,style: AppStyle.headTextSmall.copyWith(fontWeight: FontWeight.w600),),
      InkWell(
        onTap: (){

        },
        child: Text(smallText,style: AppStyle.headline1,),

      )
    ],);
  }
}
