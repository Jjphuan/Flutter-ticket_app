import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/builerlayout.dart';
import 'package:ticket_app/base/widgets/ticket_column.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/search_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;
  @override
  void didChangeDependencies() {
    if(ModalRoute.of(context)!.settings.arguments != null){
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args['index'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.ticket,
          style: AppStyle.headTextBig,
        ),
        backgroundColor: AppStyle.bgColor,
      ),
      backgroundColor: AppStyle.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 25),
          SearchTab(
            firstText: AppLocalizations.of(context)!.upcoming_flight,
            secondText: AppLocalizations.of(context)!.history,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: TicketView(
              ticket: ticketList[ticketIndex],
              isColors: false,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.66),
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TicketColumn(
                      toptext: "Hello World",
                      bottomtext: "passenger",
                      crossAxisAlignment: CrossAxisAlignment.start,
                      isColors: false,
                    ),
                    TicketColumn(
                      toptext: "MA121341",
                      bottomtext: "Departure Time",
                      crossAxisAlignment: CrossAxisAlignment.end,
                      isColors: false,
                    ),
                  ],
                ),
                SizedBox(
                    height: 30,
                    child: BuilderLayout(
                      randomDivider: 12,
                      width: 6,
                      isColor: false,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TicketColumn(
                      toptext: "A112-21221",
                      bottomtext: "E-ticket No.",
                      crossAxisAlignment: CrossAxisAlignment.start,
                      isColors: false,
                    ),
                    TicketColumn(
                      toptext: "1923671",
                      bottomtext: "Booking Code",
                      crossAxisAlignment: CrossAxisAlignment.end,
                      isColors: false,
                    ),
                  ],
                ),
                SizedBox(
                    height: 30,
                    child: BuilderLayout(
                      randomDivider: 12,
                      width: 6,
                      isColor: false,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TicketColumn(
                      toptext: "Touch N Go",
                      bottomtext: "Payment Method",
                      crossAxisAlignment: CrossAxisAlignment.start,
                      isColors: false,
                    ),
                    TicketColumn(
                      toptext: "\$ 69.99",
                      bottomtext: "Price",
                      crossAxisAlignment: CrossAxisAlignment.end,
                      isColors: false,
                    ),
                  ],
                ),
                SizedBox(
                    height: 30,
                    child: BuilderLayout(
                      randomDivider: 12,
                      width: 6,
                      isColor: false,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                )),
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: BarcodeWidget(
                      height: 75,
                      data:
                          "https://github.com/Jjphuan/Flutter-travel-app/blob/main/lib/main.dart",
                      drawText: false,
                      barcode: Barcode.code128())),
            ),
          ),
        ],
      ),
    );
  }
}
