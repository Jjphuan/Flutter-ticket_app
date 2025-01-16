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
  const TicketView({super.key, required this.ticket, this.fullTicket=false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: 190,
      child: Container(
        margin: EdgeInsets.only(right: fullTicket==false? 16:0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: AppStyle.ticketBlue,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TicketBigtext(text: ticket['from']['code']),
                      Expanded(child: Container()),
                      const BigDot(),
                      Expanded(
                          child: Stack(
                        children: [
                          const SizedBox(
                              height: 26,
                              child: BuilderLayout(randomDivider: 8)),
                          Center(
                            child: Transform.rotate(
                              angle: 1.57,
                              child: const Icon(
                                Icons.local_airport_rounded,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          )
                        ],
                      )),
                      const BigDot(),
                      Expanded(child: Container()),
                      TicketBigtext(text: ticket['to']['code'])
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(ticket['from']['name'],
                          style: AppStyle.headTextSmaller
                              .copyWith(color: Colors.white)),
                      Expanded(child: Container()),
                      Text(ticket['flying_time'],
                          style: AppStyle.headTextSmaller
                              .copyWith(color: Colors.white)),
                      Expanded(child: Container()),
                      Text(ticket['to']['name'],
                          style: AppStyle.headTextSmaller
                              .copyWith(color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: AppStyle.ticketRed,
              child: const Row(
                children: [
                  BigCircle(
                    isRight: false,
                  ),
                  Expanded(
                    child: BuilderLayout(
                      randomDivider: 10,
                      width: 5,
                    ),
                  ),
                  BigCircle(
                    isRight: true,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: AppStyle.ticketRed,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TicketColumn(
                      toptext: ticket['date'],
                      bottomtext: "Date",
                      crossAxisAlignment: CrossAxisAlignment.start),
                  TicketColumn(
                      toptext: ticket['departure_time'],
                      bottomtext: "Departure Time",
                      crossAxisAlignment: CrossAxisAlignment.center),
                  TicketColumn(
                      toptext: ticket['seat'].toString(),
                      bottomtext: "Seat",
                      crossAxisAlignment: CrossAxisAlignment.start),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
