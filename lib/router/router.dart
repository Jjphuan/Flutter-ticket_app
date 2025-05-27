import 'package:GoTravel/base/bottom_nav_bar.dart';
import 'package:GoTravel/screens/home/all_hotel.dart';
import 'package:GoTravel/screens/home/all_ticket.dart';
import 'package:GoTravel/screens/home/home_screen.dart';
import 'package:GoTravel/screens/profile/setting/about.dart';
import 'package:GoTravel/screens/profile/setting/personal_information.dart';
import 'package:GoTravel/screens/profile/setting/passengers.dart';
import 'package:GoTravel/screens/home/widgets/hotel_detail.dart';
import 'package:GoTravel/screens/login_register/login_register.dart';
import 'package:GoTravel/screens/profile/profile_screen.dart';
import 'package:GoTravel/screens/search/help_screen.dart';
import 'package:GoTravel/screens/ticket/ticket_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    initialLocation: '/',
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
          path: '/help',
          builder: (context,state) => const BottomNavBar(child: HelpScreen()),
          routes: [

          ]
      ),
      GoRoute(
          path: '/booking',
          builder: (context,state) => const BottomNavBar(child: TicketScreen()),
          routes: [

          ]
      ),
      GoRoute(
          path: '/profile',
          builder: (context,state) => const BottomNavBar(child: ProfileScreen()),
          routes: [
            GoRoute(
                path: '/login_register',
                builder: (context,state) => const LoginRegister()
            ),
            GoRoute(
                path: '/personal_information',
                builder: (context,state) => const PersonalInformation()
            ),
            GoRoute(
                path: '/passengers',
                builder: (context,state) => const Passengers()
            ),
            GoRoute(
                path: '/about',
                builder: (context,state) => const About()
            )
          ]
      )
    ]
);