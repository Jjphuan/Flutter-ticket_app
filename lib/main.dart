import 'package:flutter/material.dart';
import 'package:ticket_app/base/bottom_nav_bar.dart';
import 'package:ticket_app/screens/home/all_hotel.dart';
import 'package:ticket_app/screens/home/all_ticket.dart';
import 'package:ticket_app/screens/home/widgets/hotel_detail.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ButtomNavBar(),
        'all_tickets': (context)=> const AllTickets(),
        'ticket_screen': (context)=> const TicketScreen(),
        'all_hotels': (context)=> const AllHotel(),
        'hotel_details':(context)=> const HotelDetail(),
      }
    );
  }
}