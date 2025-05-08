import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/search/widgets/search_button.dart';
import 'package:ticket_app/screens/search/widgets/search_field.dart';
import 'package:ticket_app/screens/search/widgets/search_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        children: [
          const SizedBox(height: 38),
          Text(
            AppLocalizations.of(context)!.what_looking_for,
            style: AppStyle.headTextBig.copyWith(fontSize: 35),
          ),
          const SizedBox(height: 15,),
          SearchTab(
            firstText: AppLocalizations.of(context)!.airline_ticket,
            secondText: AppLocalizations.of(context)!.hotel,
          ),
          const SizedBox(height: 15),
          SearchField(
              text: AppLocalizations.of(context)!.departure,
              icon: Icon(Icons.flight_takeoff_outlined,color: AppStyle.iconColor)
          ),
          const SizedBox(height:10),
          SearchField(
              text: AppLocalizations.of(context)!.arrival,
              icon: Icon(Icons.flight_land_outlined,color: AppStyle.iconColor)
          ),
          const SizedBox(height: 15),
          SearchButton(label: AppLocalizations.of(context)!.find_ticket,),
          const SizedBox(height:15),
          AppDoubleText(
            bigText: AppLocalizations.of(context)!.check_discount,
            smallText: AppLocalizations.of(context)!.view_all,
            function: () => Navigator.pushNamed(context,"all_tickets")
            ),
          const SizedBox(height: 15),
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