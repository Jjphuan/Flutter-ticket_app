import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/utils/all_json.dart';
import 'package:GoTravel/base/widgets/builerlayout.dart';
import 'package:GoTravel/base/widgets/ticket_column.dart';
import 'package:GoTravel/base/widgets/ticket_view.dart';
import 'package:GoTravel/screens/search/widgets/search_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:dotted_line/dotted_line.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;
  bool recentBook = false;

  final GlobalKey _containerKey1 = GlobalKey();
  double _containerHeight1 = 0;
  double _containerWidth1 = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox box1 = _containerKey1.currentContext?.findRenderObject() as RenderBox;
      setState(() {
        _containerHeight1 = box1.size.height;
        _containerWidth1 = box1.size.width;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.my_booking,
          style: AppStyle.headTextBig,
        ),
        backgroundColor: AppStyle.bgColor,
      ),
      backgroundColor: AppStyle.bgColor,
      body: CustomScrollView(
        slivers: [
          MultiSliver(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    AppLocalizations.of(context)!.recent_ticket,
                    style: AppStyle.headTextSmall,
                  ),
                ),
                (recentBook) ? Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Container(
                        key: _containerKey1,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )
                        ),
                        padding: const EdgeInsets.only(right: 10,top: 6,bottom: 6),
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 5),
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 6),
                                  height: _containerHeight1 / 30,
                                  width: 2,
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(top: 5),
                                ),
                                const Positioned(
                                    top: 5,
                                    left: -1,
                                    child: Icon(
                                      Icons.circle,
                                      size: 14,
                                      color: Colors.white,
                                    )
                                ),
                                const Positioned(
                                    bottom: 0,
                                    left: -1,
                                    child: Icon(
                                      Icons.circle,
                                      size: 14,
                                      color: Colors.white,
                                    )
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 6),
                                      width: _containerWidth1 / 1.55,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "TBS(Terminal Bersepadu Selatan),Kuala Lumpur",
                                            style: AppStyle.headTextSmall.copyWith(
                                              color: Colors.white,
                                              fontSize: 16
                                            ),
                                          ),
                                          Text(
                                            "TBS(Terminal Bersepadu Selatan)",
                                            style: AppStyle.headTextSmall.copyWith(
                                                color: Colors.white,
                                                fontSize: 11
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: _containerWidth1 / 5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                "12:30",
                                              style: AppStyle.headTextSmall.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),
                                            ),
                                            Text(
                                              "Mon,12 May",
                                              style: AppStyle.headTextSmall.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12
                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 16),
                                  width: _containerWidth1/1.17,
                                  height: 1,
                                  color: Colors.white,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 6),
                                      width: _containerWidth1 / 1.55,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "TBS(Terminal Bersepadu Selatan),Kuala Lumpur",
                                            style: AppStyle.headTextSmall.copyWith(
                                                color: Colors.white,
                                                fontSize: 16
                                            ),
                                          ),
                                          Text(
                                            "TBS(Terminal Bersepadu Selatan)",
                                            style: AppStyle.headTextSmall.copyWith(
                                                color: Colors.white,
                                                fontSize: 11
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: _containerWidth1 / 5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "12:30",
                                              style: AppStyle.headTextSmall.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 18
                                              ),
                                            ),
                                            Text(
                                              "Mon,12 May",
                                              style: AppStyle.headTextSmall.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12
                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            )
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                        margin: const EdgeInsets.only(right: 15,left:15, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KKKL Express",
                              style: AppStyle.headTextSmall.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Phuan Jun Jie",
                                          style: AppStyle.headTextSmall.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFB2F0F7),
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Text(
                                            "7",
                                            style: AppStyle.headTextSmall.copyWith(
                                              fontSize: 13,
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.w800
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    DottedLine(
                                      dashColor: Colors.grey,
                                      dashLength: 5.0,
                                      dashGapLength: 6.0,
                                      lineThickness: 1.5,
                                    ),
                                    const SizedBox(height: 15),
                                    Center(
                                      child: InkWell(
                                        onTap: (){},
                                        child: Text(
                                          AppLocalizations.of(context)!.view_ticket_detail,
                                          style: AppStyle.headTextSmall.copyWith(
                                            color: Colors.blue,
                                            fontSize: 15
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ):
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.no_upcoming_trip,
                      style: AppStyle.headTextSmaller.copyWith(
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.plan_journey,
                      style: AppStyle.headTextSmaller.copyWith(
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white, // text/icon color
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.book_now,
                          style: AppStyle.headTextSmaller,
                        )
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                SliverPinnedHeader(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                      width: double.infinity,
                      child: Text(
                        AppLocalizations.of(context)!.past_booking,
                        style: AppStyle.headTextSmall.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                ),
                SliverClip(
                  child: MultiSliver(
                      children: List<Widget>.generate(
                        ticketList.length,(index){
                          final currentTicket = ticketList[index];
                          return SliverToBoxAdapter(
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                currentTicket['departure'],
                                                style: AppStyle.headTextSmall.copyWith(
                                                  color: Colors.black,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Icon(Icons.arrow_forward,color: Colors.grey),
                                            ),
                                            Flexible(
                                              child: Text(
                                                currentTicket['destination'],
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
                                          currentTicket['departure_time'],
                                          style: AppStyle.headTextSmall.copyWith(
                                              color: Colors.black38,
                                              fontSize: 14
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          currentTicket['bus_name'],
                                          style: AppStyle.headTextSmall.copyWith(
                                              color: Colors.black38,
                                              fontSize: 14
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "${AppLocalizations.of(context)!.passenger} :  ${currentTicket['passenger']}",
                                          style: AppStyle.headTextSmall.copyWith(
                                              color: Colors.black38,
                                              fontSize: 14
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  if(index != ticketList.length-1) const Divider(
                                    height: 0,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          );
                      }
                      )
                  )
                ),
              ]
          )
        ],
      ),
    );
  }
}
