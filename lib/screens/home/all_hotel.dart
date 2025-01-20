import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/base/utils/all_json.dart';

class AllHotel extends StatelessWidget {
  const AllHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "All Hotels",
            style: AppStyle.headTextBig,
          ),
          backgroundColor: AppStyle.bgColor,
        ),
        backgroundColor: AppStyle.bgColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8),
              itemCount: hotelList.length,
              itemBuilder: (context, index) {
                var singleHotel = HotelGrid(hotelList: hotelList[index]);
                return Container(
                  child: singleHotel,
                );
              }),
        ));
  }
}

class HotelGrid extends StatelessWidget {
  final Map<String, dynamic> hotelList;
  const HotelGrid({super.key, required this.hotelList});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "hotel_details");
      },
      child: Container(
        margin: const EdgeInsets.only(right: 25),
        padding: const EdgeInsets.all(9),
        width: size.width * 0.6,
        decoration: BoxDecoration(
            color: AppStyle.primaryColor,
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/images/${hotelList['image']}'))),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                hotelList['name'],
                style: AppStyle.headTextSmall.copyWith(color: Colors.grey[400]),
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                hotelList['place'],
                style: AppStyle.headTextSmaller.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "\$${hotelList['price']} /night",
                style:
                    AppStyle.headTextSmaller.copyWith(color: Colors.grey[400]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
