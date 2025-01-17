import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: const Row(
        children: [
          AppTab(tabText: "Airline Tickets"),
          AppTab(
            tabText: "Hotel",
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
          color: (tabSide == false) ? Colors.grey[300] : Colors.grey[400],
        ),
        child: Center(
          child: Text(
            tabText,
            style: AppStyle.headTextSmaller,
          ),
        ));
  }
}
