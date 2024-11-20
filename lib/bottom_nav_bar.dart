import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/screens/home_screen.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  final appScreen = [
    const HomeScreen(),
    Text("Search"),
    Text("Tickets"),
    Text("Profile"),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
        _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ticket"),
      ),
      body: appScreen[_selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_add_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                  label: "Tickets"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: "Profile"),
            ]),
      ),
    );
  }
}
