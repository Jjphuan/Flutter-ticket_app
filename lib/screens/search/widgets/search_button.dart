import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 60, 49, 213)
      ),
      child: Center(
        child: Text(
          "Find Tickets",
          style: AppStyle.headTextSmall.copyWith(color:Colors.white)
          ),
      ),
    );
  }
}