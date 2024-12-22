import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/widgets/bigdot.dart';
import 'package:ticket_app/base/widgets/builerlayout.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      width: size.width*0.85,
      height: 180,
      child: Container(
          margin: EdgeInsets.only(right: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius:BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            color: AppStyle.tickerBlue,
            ),
          child: Column(children: [
            Row(
              children: [
                Text("NYC",style: AppStyle.headTextSmall.copyWith(color: Colors.white),),
                Expanded(child: Container()),
                const BigDot(),
                Expanded(child: Stack(
                  children: [
                    const SizedBox(
                    height: 26,
                    child: BuilderLayout(randomDivider: 8) 
                  ),
                    Center(
                      child: Transform.rotate(
                        angle: 1.55,
                        child: const Icon(
                          Icons.local_airport_rounded,
                          color: Colors.white,
                          size: 26,
                          ),
                    ),)
                ],
                )),
                const BigDot(),
                Expanded(child: Container()),
                Text("WAS",style: AppStyle.headTextSmall.copyWith(color: Colors.white),)
              ],
            ),
            Row(
              children: [
                Text("New York",style: AppStyle.headTextSmall.copyWith(color: Colors.white),),
                Expanded(child: Container()),
                Text("8H 30M",style: AppStyle.headTextSmall.copyWith(color:Colors.white)),
                Expanded(child: Container()),
                Text("Washington",style: AppStyle.headTextSmall.copyWith(color: Colors.white),)
              ],
            )
          ],),
        ),
    );
  }
}
