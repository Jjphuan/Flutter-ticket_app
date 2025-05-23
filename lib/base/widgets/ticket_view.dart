import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/widgets/big_circle.dart';
import 'package:GoTravel/base/widgets/bigdot.dart';
import 'package:GoTravel/base/widgets/builerlayout.dart';
import 'package:GoTravel/base/widgets/ticket_bigText.dart';
import 'package:GoTravel/base/widgets/ticket_column.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool fullTicket;
  final bool isColors;
  const TicketView({super.key, required this.ticket, this.fullTicket = false, this.isColors=true});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 1.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueAccent,
        )
      ),
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  ticket['departure'],
                  style: AppStyle.headTextSmall.copyWith(
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.arrow_forward),
              ),
              Flexible(
                child: Text(
                  ticket['destination'],
                  style: AppStyle.headTextSmall.copyWith(
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            ticket['departure_time'],
            style: AppStyle.headTextSmall.copyWith(
                color: Colors.black38,
                fontSize: 14
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            ticket['bus_name'],
            style: AppStyle.headTextSmall.copyWith(
                color: Colors.black38,
                fontSize: 14
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${AppLocalizations.of(context)!.passenger} :  ${ticket['passenger']}",
            style: AppStyle.headTextSmall.copyWith(
                color: Colors.black38,
                fontSize: 14
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
