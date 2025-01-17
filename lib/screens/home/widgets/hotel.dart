import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class Hotel extends StatelessWidget {
  final Map<String,dynamic> hotelList;
  const Hotel({super.key, required this.hotelList});
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.all(9),
      width: size.width*0.6,
      height: 350,
      decoration: BoxDecoration(
        color: AppStyle.primaryColor,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/${hotelList['image']}'
                )
              )
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotelList['name'],
              style: AppStyle.headTextBig.copyWith(color: Colors.grey[400]),
              ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotelList['place'],
              style: AppStyle.headTextSmall.copyWith(color: Colors.white),
              ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "\$${hotelList['price']} /night",
              style: AppStyle.headTextBig.copyWith(color: Colors.grey[400]),
              ),
          )
        ],
      ),
    );
  }
}
