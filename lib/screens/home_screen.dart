
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';

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
                  child: const Row(
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_search_filled),
                      Text("text 1"),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                AppDoubleText(bigText: 'Upcoming Flight',smallText: 'view all',),
                TicketView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}