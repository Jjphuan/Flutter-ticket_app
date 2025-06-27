import 'dart:core';

import 'package:GoTravel/base/utils/all_json.dart';
import 'package:GoTravel/base/widgets/app_double_text.dart';
import 'package:GoTravel/base/widgets/ticket_view.dart';
import 'package:GoTravel/provider/login_register_provider.dart';
import 'package:GoTravel/screens/home/widgets/offer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base/res/Style/app_style.dart';
import '../../base/res/media.dart';
import '../../provider/home_provider.dart';
import '../../provider/locale_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';

  @override
  void initState(){
    _getInitVariable();
    _getDiscount();
    super.initState();
  }

  void _getInitVariable()async{
    final provider = Provider.of<LoginRegisterProvider>(context,listen: false);
    final prefs = await SharedPreferences.getInstance();

    await provider.checkLoginToken(context);
    setState(() {
      username = prefs.getString('name') ?? AppLocalizations.of(context)!.guest;
    });
  }

  void _getDiscount() async{
    final provider = Provider.of<HomeProvider>(context,listen: false);

    await provider.getDiscount(context);
  }

  Future<void> _selectDate(String way) async{
    final provider = Provider.of<HomeProvider>(context,listen: false);

    DateTime? now;

    if(way == 'return'){
      if(provider.startDate != ''){
        DateTime startTime = DateTime.parse(provider.startDate);
        now = startTime;
      }else{
        now = DateTime.now() ;
      }
    }else{
       now = DateTime.now() ;
    }

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: DateTime(now.year, now.month + 1, now.day)
    );

    if(pickedDate != null){
      final formatedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      switch(way){
        case 'journey':
          await provider.addSelection(formatedDate, 'start');
          break;
        case 'return':
          await provider.addSelection(formatedDate, 'return');
          break;
      }
    }
  }

  bool checkFieldSelect(){
    final provider = Provider.of<HomeProvider>(context,listen: false);

    if(provider.from.isNotEmpty && provider.to.isNotEmpty && provider.startDate.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context,listen: true);

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
                          username,
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
                // search ticket
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //from
                      GestureDetector(
                        onTap: (){
                          context.go(
                              '/search_ticket',
                            extra: {
                                'hint': AppLocalizations.of(context)!.from,
                                'search_key': 'from'
                            }
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),topRight: Radius.circular(12)
                              ),
                              color: Colors.white
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.directions_bus_filled),
                              const SizedBox(width: 5),
                              Text(
                                (homeProvider.from.isNotEmpty) ?
                                   homeProvider.from : AppLocalizations.of(context)!.from,
                                style: AppStyle.headTextSmaller.copyWith(
                                  color: (homeProvider.from.isEmpty) ?
                                        Colors.grey : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 0,thickness: 1,color: Colors.grey,),
                      // to
                      GestureDetector(
                        onTap: (){
                          context.go(
                              '/search_ticket',
                              extra: {
                                'hint': AppLocalizations.of(context)!.to,
                                'search_key': 'to'
                              }
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.directions_bus_filled),
                              const SizedBox(width: 5),
                              Text(
                                (homeProvider.to.isNotEmpty) ?
                                  homeProvider.to : AppLocalizations.of(context)!.to,
                                style: AppStyle.headTextSmaller.copyWith(
                                    color: (homeProvider.to.isEmpty) ?
                                            Colors.grey : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 0,thickness: 1,color: Colors.grey,),
                      // date of journey
                      GestureDetector(
                        onTap: (){
                          _selectDate('start');
                        },
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 7),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.journey_date,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    homeProvider.startDate,
                                    style: AppStyle.headTextSmaller.copyWith(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 0,thickness: 1,color: Colors.grey,),
                      // date of return
                      GestureDetector(
                        onTap: (){
                          _selectDate('return');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)
                              ),
                              color: Colors.white
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: (homeProvider.returnDate.isEmpty) ? 13.5 : 6
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (homeProvider.returnDate.isNotEmpty) Text(
                                        AppLocalizations.of(context)!.return_date,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        (homeProvider.returnDate.isNotEmpty) ?
                                          homeProvider.returnDate : AppLocalizations.of(context)!.return_date,
                                        style: AppStyle.headTextSmaller.copyWith(
                                            color: (homeProvider.returnDate.isEmpty) ? Colors.grey : Colors.black,
                                            fontSize: (homeProvider.returnDate.isEmpty) ? 20 : 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if(homeProvider.returnDate.isNotEmpty)
                                IconButton(
                                  icon: const Icon(Icons.cancel,size: 18,),
                                  onPressed: () {
                                    homeProvider.removeSelections('return');
                                  },)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    if(checkFieldSelect()){
                      print(homeProvider.from);
                      print(homeProvider.to);
                      print(homeProvider.startDate);
                      print(homeProvider.returnDate);
                    }
                  },
                  child: Container(
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
                ),
                const SizedBox(
                  height: 40,
                ),
                // recent ticket
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
                // discount
                AppDoubleText(
                  bigText: AppLocalizations.of(context)!.offer,
                  smallText: AppLocalizations.of(context)!.view_all,
                  function: () => Navigator.pushNamed(context, "all_hotels"),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: homeProvider.discountList
                        .map((offer) => GestureDetector(
                            onTap: () {
                              var index = homeProvider.discountList.indexOf(offer);
                              // context.go();
                            },
                            child: Offer(offer: offer)))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 20),
                // refer & earn
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
                    gradient: const LinearGradient(
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
