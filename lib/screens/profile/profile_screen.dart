import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical:  10,horizontal: 5),
                    padding: const EdgeInsets.all(10),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(AppMedia.logo)
                        )
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Book Ticket",style: AppStyle.headTextBig,),
                      Text("New York", style: AppStyle.headTextSmaller.copyWith(color: Colors.grey[600]),),
                      const SizedBox(height:5),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: const Icon(
                                FluentSystemIcons.ic_fluent_premium_filled,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                            const SizedBox(width: 5,),
                            const Text("Premium Status")
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: InkWell(
                    onTap: (){
                      context.go('/profile/setting');
                    },
                    child: const Icon(Icons.settings)
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 80,
            decoration: BoxDecoration(
              color: AppStyle.ticketBlue,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Icon(
                    FluentSystemIcons.ic_fluent_lightbulb_filament_regular,
                    size: 35,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Text(
                        AppLocalizations.of(context)!.your_new_award,
                        style: AppStyle.headTextSmall.copyWith(color: Colors.white)),
                    Text("you have 10 Flight in this year",style: AppStyle.headTextSmaller.copyWith(color: Colors.white),)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
              3, (index){
                return Container(
                  child: Text("Testing"),
                );
            }
          )
        ],
      ),
    );
  }
}