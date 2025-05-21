import 'package:go_router/go_router.dart';
import 'package:ticket_app/base/bottom_nav_bar.dart';
import 'package:ticket_app/screens/home/all_hotel.dart';
import 'package:ticket_app/screens/home/all_ticket.dart';
import 'package:ticket_app/screens/home/home_screen.dart';
import 'package:ticket_app/screens/home/setting/setting_account.dart';
import 'package:ticket_app/screens/home/setting/change_language.dart';
import 'package:ticket_app/screens/home/setting/setting.dart';
import 'package:ticket_app/screens/home/widgets/hotel_detail.dart';
import 'package:ticket_app/screens/profile/profile_screen.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

final GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context,state) => const BottomNavBar(child: HomeScreen()),
          routes: [
                GoRoute(
                    path: '/all_tickets',
                    builder: (context,state) => const AllTickets()
                ),
                GoRoute(
                    path: '/ticket_screen',
                    builder: (context,state) => const TicketScreen()
                ),
                GoRoute(
                    path: '/all_hotels',
                    builder: (context,state) => const AllHotel()
                ),
                GoRoute(
                    path: '/hotel_details',
                    builder: (context,state) => const HotelDetail()
                ),
          ]
      ),
      GoRoute(
          path: '/search',
          builder: (context,state) => const BottomNavBar(child: SearchScreen()),
          routes: [

          ]
      ),
      GoRoute(
          path: '/tickets',
          builder: (context,state) => const BottomNavBar(child: TicketScreen()),
          routes: [

          ]
      ),
      GoRoute(
          path: '/profile',
          builder: (context,state) => const BottomNavBar(child: ProfileScreen()),
          routes: [
                GoRoute(
                    path: '/setting',
                    builder: (context,state) => const Setting(),
                    routes: [
                      GoRoute(
                          path: '/change_language',
                          builder: (context,state) => const ChangeLanguage()
                      ),
                      GoRoute(
                          path: '/setting_account',
                          builder: (context,state) => const SettingAccount()
                      )
                    ]
                )
          ]
      )
    ]
);