import 'package:GoTravel/base/utils/all_json.dart';
import 'package:GoTravel/base/widgets/app_double_text.dart';
import 'package:GoTravel/base/widgets/ticket_view.dart';
import 'package:GoTravel/screens/home/widgets/offer.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../base/res/Style/app_style.dart';
import '../../base/res/media.dart';
import '../../provider/locale_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcome,
                          style: AppStyle.headTextSmall,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          AppLocalizations.of(context)!.book_ticket,
                          style: AppStyle.headTextBig,
                        )
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                AppMedia.logo
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.directions_bus_filled),
                              const SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context)!.from,
                                style: AppStyle.headTextSmaller.copyWith(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 0,),
                      GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.directions_bus_filled),
                              const SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context)!.to,
                                style: AppStyle.headTextSmaller.copyWith(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 0,),
                      GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              const SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context)!.journey_date,
                                style: AppStyle.headTextSmaller.copyWith(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 0,),
                      GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              const SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context)!.return_date,
                                style: AppStyle.headTextSmaller.copyWith(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search,size: 30,color: Colors.white),
                      const SizedBox(width: 5),
                      Text(
                        AppLocalizations.of(context)!.search_ticket,
                        style: AppStyle.headTextSmall.copyWith(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AppDoubleText(
                  bigText: AppLocalizations.of(context)!.recent_ticket,
                  smallText: AppLocalizations.of(context)!.view_all,
                  function: () => Navigator.pushNamed(context, "all_tickets"),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ticketList
                          .take(4)
                          .map((singleTicket) => GestureDetector(
                              onTap: () {
                                var index = ticketList.indexOf(singleTicket);
                                Navigator.pushNamed(context, "ticket_screen",
                                    arguments: {'index': index});
                              },
                              child: TicketView(
                                ticket: singleTicket,
                              )))
                          .toList(),
                    )
                ),
                const SizedBox(
                  height: 40,
                ),
                AppDoubleText(
                  bigText: AppLocalizations.of(context)!.offer,
                  smallText: AppLocalizations.of(context)!.view_all,
                  function: () => Navigator.pushNamed(context, "all_hotels"),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: offerList
                        .take(6)
                        .map((offer) => GestureDetector(
                            onTap: () {
                              var index = hotelList.indexOf(offer);
                              Navigator.pushNamed(
                                context, "hotel_details",arguments: {
                                  'index': index
                                });
                            },
                            child: Offer(offer: offer)))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.refer_earn,
                  style: AppStyle.headTextSmall.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.lightBlueAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16), // optional
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.earn150,
                            style: AppStyle.headTextSmall.copyWith(
                              fontSize: 20
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: Text(
                              AppLocalizations.of(context)!.invite_friend,
                              style: AppStyle.headTextSmall.copyWith(
                                  fontSize: 15,
                                  color: Colors.grey
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.refer_now,
                          style: AppStyle.headTextSmall.copyWith(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
