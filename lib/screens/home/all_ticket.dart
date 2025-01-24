import 'package:flutter/material.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Ticket"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: ticketList
                      .map((singleTicket) => GestureDetector(
                            onTap: () {
                              var index = ticketList.indexOf(singleTicket);
                              Navigator.pushNamed(
                                context, 
                                "ticket_screen",
                                arguments: {
                                  'index':index
                                });
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.only(bottom: 20, top: 15),
                                child: TicketView(
                                  ticket: singleTicket,
                                  fullTicket: true,
                                )),
                          ))
                      .toList()))
        ],
      ),
    );
  }
}
