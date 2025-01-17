import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/search/widgets/search_button.dart';
import 'package:ticket_app/screens/search/widgets/search_field.dart';
import 'package:ticket_app/screens/search/widgets/search_tab.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        children: [
          const SizedBox(height: 38),
          Text(
            "What are \nyou looking for?",
            style: AppStyle.headTextBig.copyWith(fontSize: 35),
          ),
          const SizedBox(height: 15,),
          const SearchTab(),
          const SizedBox(height: 15),
          SearchField(text: "Departure",icon: Icon(Icons.flight_takeoff_outlined,color: AppStyle.iconColor)),
          const SizedBox(height:10),
          SearchField(text: "Arrival",icon: Icon(Icons.flight_land_outlined,color: AppStyle.iconColor)),
          const SizedBox(height: 15),
          const SearchButton(),
          const SizedBox(height:15),
          AppDoubleText(
            bigText: "Upcoming Flight", 
            smallText: "View All", 
            function: () => Navigator.pushNamed(context,"all_tickets")
            ),
        ],
      ),
    );
  }
}