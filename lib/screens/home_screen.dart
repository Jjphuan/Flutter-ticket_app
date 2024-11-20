
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning",style: TextStyle(),),
                        SizedBox(height: 5),
                        Text("Book Ticket")
                      ],
                    ),
                    Container(
                      color: Colors.red,
                      width: 70,
                      height: 70
                    ),
                  ],
                ),const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("text 1"),
                    Text("text 2")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}