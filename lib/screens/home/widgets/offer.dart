import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/widgets/big_circle.dart';
import 'package:GoTravel/base/widgets/bigdot.dart';
import 'package:GoTravel/base/widgets/builerlayout.dart';
import 'package:GoTravel/base/widgets/ticket_bigText.dart';
import 'package:GoTravel/base/widgets/ticket_column.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Offer extends StatelessWidget {
  final Map<String, dynamic> offer;
  const Offer({super.key, required this.offer,});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 1.4,
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            offer['title'],
            style: AppStyle.headTextSmall.copyWith(
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            offer['expired_at'],
            style: AppStyle.headTextSmall.copyWith(
                color: Colors.white,
                fontSize: 14
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 45),
          Text(
            offer['description'],
            style: AppStyle.headTextSmall.copyWith(
                color: Colors.white,
                fontSize: 14
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
