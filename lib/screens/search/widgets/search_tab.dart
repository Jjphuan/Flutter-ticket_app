import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';

class SearchTab extends StatelessWidget {
  final String firstText;
  final String secondText;
  const SearchTab({super.key,required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          AppTab(tabText: firstText),
          AppTab(
            tabText: secondText,
            tabBorder: true,
            tabSide: true,
          ),
        ],
      ),
    );
  }
}

class AppTab extends StatelessWidget {
  final String tabText;
  final bool tabBorder;
  final bool tabSide;
  const AppTab(
      {super.key,
      required this.tabText,
      this.tabBorder = false,
      this.tabSide = false});

  @override
  Widget build(BuildContext context) {
    final tabSize = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: tabSize.width * 0.460,
        decoration: BoxDecoration(
          borderRadius: (tabBorder == false)
              ? const BorderRadius.horizontal(left: Radius.circular(20))
              : const BorderRadius.horizontal(right: Radius.circular(20)),
          color: (tabSide == false) ? const Color.fromARGB(255, 204, 204, 204) : const Color.fromARGB(255, 121, 121, 121),
        ),
        child: Center(
          child: Text(
            tabText,
            style: AppStyle.headTextSmaller,
          ),
        ));
  }
}
