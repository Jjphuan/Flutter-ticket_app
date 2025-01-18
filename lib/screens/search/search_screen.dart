import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/search/widgets/search_button.dart';
import 'package:ticket_app/screens/search/widgets/search_field.dart';
import 'package:ticket_app/screens/search/widgets/search_tab.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 410,
                    width: screenSize.width*0.44,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          spreadRadius: 1
                        )
                        ]
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppMedia.hotel_view)
                            )
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "20% discount on the early booking for this flight. Let Check it!",
                          style: AppStyle.headTextSmall,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14,vertical:10),
                        width: screenSize.width*0.44,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 115, 189, 221),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount a\nsurvey",
                              style: AppStyle.headTextSmall.copyWith(color: Colors.white)
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Take a survey about our services and get discount.",
                              style: AppStyle.headTextSmaller
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height:10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14,vertical:10),
                        width: screenSize.width*0.44,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 230, 141, 34),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Help us improve",
                              style: AppStyle.headTextSmall.copyWith(color: Colors.white)
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Give us suggestion to improve your experience",
                              style: AppStyle.headTextSmaller
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
            ],
          )
        ],
      ),
    );
  }
}