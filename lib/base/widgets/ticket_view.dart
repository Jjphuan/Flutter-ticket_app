import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/bigdot.dart';
import 'package:ticket_app/base/widgets/builerlayout.dart';
import 'package:ticket_app/base/widgets/ticket_bigText.dart';
import 'package:ticket_app/base/widgets/ticket_column.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool fullTicket;
  final bool isColors;
  const TicketView({super.key, required this.ticket, this.fullTicket = false, this.isColors=true});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: 185.5,
      child: Container(
        margin: EdgeInsets.only(right: fullTicket == false ? 16 : 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: isColors == true ? AppStyle.ticketBlue : Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TicketBigtext(text: ticket['from']['code'],isColor: isColors,),
                      Expanded(child: Container()),
                      BigDot(isColor: isColors,),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                                height: 26,
                                child: BuilderLayout(randomDivider: 8,isColor:isColors)),
                            Center(
                              child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColors == true ? Colors.white:Colors.black,
                                  size: 26,
                                ),
                              ),
                            )
                          ],
                      )),
                      BigDot(isColor: isColors,),
                      Expanded(child: Container()),
                      TicketBigtext(text: ticket['to']['code'],isColor: isColors,)
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(ticket['from']['name'],
                          style: AppStyle.headTextSmaller
                              .copyWith(color: isColors == true ? Colors.white:Colors.black)),
                      Expanded(child: Container()),
                      Text(ticket['flying_time'],
                          style: AppStyle.headTextSmaller
                              .copyWith(color: isColors == true ? Colors.white:Colors.black)),
                      Expanded(child: Container()),
                      Text(ticket['to']['name'],
                          style: AppStyle.headTextSmaller
                              .copyWith(color: isColors == true ? Colors.white:Colors.black))
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: isColors == true ? AppStyle.ticketRed : Colors.white,
              child: Row(
                children: [
                  const BigCircle(
                    isRight: false,
                  ),
                  Expanded(
                    child: BuilderLayout(
                      randomDivider: 10,
                      width: 5,
                      isColor: isColors,
                    ),
                  ),
                  const BigCircle(
                    isRight: true,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: isColors == true ? Radius.circular(15) : Radius.circular(0),
                    bottomRight: isColors == true ? Radius.circular(15) : Radius.circular(0)),
                color: isColors == true ? AppStyle.ticketRed : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TicketColumn(
                      toptext: ticket['date'],
                      bottomtext: "Date",
                      crossAxisAlignment: CrossAxisAlignment.start,
                      isColors: isColors,),
                  TicketColumn(
                      toptext: ticket['departure_time'],
                      bottomtext: "Departure Time",
                      crossAxisAlignment: CrossAxisAlignment.center,
                      isColors: isColors,
                      ),
                  TicketColumn(
                      toptext: ticket['seat'].toString(),
                      bottomtext: "Seat",
                      crossAxisAlignment: CrossAxisAlignment.start,
                      isColors: isColors,
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
