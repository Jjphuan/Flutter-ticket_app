
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/home/widgets/hotel.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/base/utils/all_json.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: ListView(
        children: [
          const SizedBox(height: 40,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning",style: AppStyle.headTextSmall,),
                        const SizedBox(height: 5),
                        Text("Book Ticket",style: AppStyle.headTextBig,)
                      ],
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        image: const DecorationImage(
                          image: AssetImage(AppMedia.logo),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ],
                ),const SizedBox(height: 25,)
                ,Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_filled),
                      const SizedBox(width: 5),
                      Text("Search",style: AppStyle.headTextSmaller,),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                AppDoubleText(
                  bigText: 'Upcoming Flight',
                  smallText: 'view all',
                  function:  () => Navigator.pushNamed(context,"all_tickets"),
                  ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ticketList.take(6).map((singleTicket)=>
                    TicketView(ticket: singleTicket,)).toList(),
                  )
                ),
                const SizedBox(height: 40,),
                AppDoubleText(
                  bigText: 'Hotels',
                  smallText: 'view all',
                  function:  () => Navigator.pushNamed(context,"all_hotels"),
                  ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: 
                    hotelList.take(6).map((singlehotel)=>
                        Hotel(hotelList:singlehotel)
                      ).toList()
                    ,
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}