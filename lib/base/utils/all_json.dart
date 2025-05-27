import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

List<Map<String, dynamic>> ticketList = [
  {
    'bus_station': "hotel 1",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 2",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 3",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 4",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 4",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 4",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 4",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 4",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 4",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  },
  {
    'bus_station': "hotel 4",
    'departure' : "place 1",
    'destination' : "place 2",
    'departure_time': '1 May 2025 18:30',
    'arrival_time': '1 May 2020 18:35',
    'bus_name': 'KKKL Express',
    'passenger': 1,
    'location': "Kluang Bus Terminal, Kluang",
    'price': 12.00,
  }
];

List<Map<String, dynamic>> hotelList = [
  {
    'image': 'hotel_room.jpg',
    'name': 'One Hotel',
    'place': 'London',
    'price': 30,
    'details': "One hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles.",
    'images': [
      'hotel_view1.jpg',
      'hotel_view2.jpg',
      'hotel_view3.jpg',
    ] 
  },
  {
    'image': 'hotel_room1.jpg',
    'name': 'Pyramid Hotel',
    'place': 'Washington',
    'price': 35,
    'details': "Pyramid hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles.",
    'images': [
      'hotel_view1.jpg',
      'hotel_view2.jpg',
      'hotel_view3.jpg',
    ] 
  },
  {
    'image': 'hotel_pool.jpg',
    'name': 'Ever Oop Hotel',
    'place': 'Los Angelas',
    'price': 40,
    'details': "Ever Oop hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles. Inns have existed since very ancient times to serve merchants and other travelers.hotel, building that provides lodging, meals, and other services to the traveling public on a commercial basis. A motel performs the same functions as a hotel but in a format designed for travelers using automobiles.",
    'images': [
      'hotel_view1.jpg',
      'hotel_view2.jpg',
      'hotel_view3.jpg',
    ] 
  },
];


List<Map<String, dynamic>> offerList = [
  {
    'title': "Save up to 60%",
    "valid_date": "Valid till 31 Dec 2025",
    "desc": "Offer from Kuala Lumpur to Penang"
  },
  {
    'title': "Save up to 30%",
    "valid_date": "Valid till 31 Dec 2025",
    "desc": "Offer from Kuala Lumpur to Penang dsafdgfd"
  },
  {
    'title': "Save up to 20%",
    "valid_date": "Valid till 31 Dec 2025",
    "desc": "Offer from Kuala Lumpur to Penang"
  }
];

List<Map<String, dynamic>> questionList = [
  {
    'question': "This is question one 1.",
    "answers": "This is answer 1 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 2.",
    "answers": "This is answer 2 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 3.",
    "answers": "This is answer 3 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 4.",
    "answers": "This is answer 4 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 5.",
    "answers": "This is answer 5 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 6.",
    "answers": "This is answer 6 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 7.",
    "answers": "This is answer 7 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 8.",
    "answers": "This is answer 8 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 9.",
    "answers": "This is answer 9 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 10.",
    "answers": "This is answer 10 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
  {
    'question': "This is question one 11.",
    "answers": "This is answer 11 and long text dhas adshjidt asjdoai qdoa  asi asio adjaosdj",
  },
];

List<Map<String, dynamic>> getSettingList(BuildContext context) {
  return [
    {
      "id": 1,
      "icon":  const Icon(Icons.person),
      "name": AppLocalizations.of(context)!.personal_information,
      'route': "personal_information"
    },
    {
      "id": 2,
      "icon": const Icon(Icons.people),
      "name": AppLocalizations.of(context)!.passenger,
      'route': "passengers"
    },
    {
      "id": 3,
      "icon": const Icon(Icons.language),
      "name": AppLocalizations.of(context)!.change_language,
    },
    {
      "id": 4,
      "icon": const Icon(Icons.info),
      "name": AppLocalizations.of(context)!.about_us,
      'route': "about"
    },
    {
      "id": 5,
      "icon": const Icon(Icons.call),
      "name": AppLocalizations.of(context)!.contact_us,
    },
    {
      "id": 6,
      "icon": const Icon(Icons.settings),
      "name": AppLocalizations.of(context)!.account_setting,
    }
  ];
}

List<Map<String, dynamic>> getHelpList(BuildContext context) {
  return [
    {
      "icon":  const Icon(Icons.import_contacts,size: 50,color: Colors.blue,),
      "name": AppLocalizations.of(context)!.getting_start,
    },
    {
      "icon": const Icon(Icons.directions_bus,size: 50,color: Colors.blue),
      "name": AppLocalizations.of(context)!.booking,
    },
    {
      "icon": const Icon(Icons.person,size: 50,color: Colors.blue),
      "name": AppLocalizations.of(context)!.account_setting,
    },
    {
      "icon": const Icon(Icons.key,size: 50,color: Colors.blue),
      "name": AppLocalizations.of(context)!.login_and_password,
    },
    {
      "icon": const Icon(Icons.monetization_on_outlined,size: 50,color: Colors.blue),
      "name": AppLocalizations.of(context)!.purchase_and_refund,
    },
    {
      "icon": const Icon(Icons.security,size: 50,color: Colors.blue),
      "name": AppLocalizations.of(context)!.trust_and_safety,
    }
  ];
}
