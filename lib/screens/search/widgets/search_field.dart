import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class SearchField extends StatelessWidget {
  final Icon icon;
  final String text;
  const SearchField({super.key ,required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(text,style: AppStyle.headTextSmall.copyWith(color:const Color.fromARGB(255, 101, 101, 101)))
        ],
      ),
    );
  }
}
