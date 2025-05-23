import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/utils/all_json.dart';
import 'package:GoTravel/controller/expand_text_controller.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    index = args['index'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/${hotelList[index]['image']}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    color: Colors.black.withOpacity(0.5),
                    child: Text(hotelList[index]['name'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.all(16),
              child: ExpandedText(text: hotelList[index]['details']),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "More Images",
                style: AppStyle.headTextSmall,
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotelList[index]["images"].length,
                itemBuilder: (context, imagesIndex) {
                  return Container(
                    margin: EdgeInsets.all(16),
                    child: Image.asset(
                        "assets/images/${hotelList[index]["images"][imagesIndex]}"),
                  );
                },
              ),
            )
          ]))
        ],
      ),
    );
  }
}

class ExpandedText extends StatelessWidget {
  final String text;
  ExpandedText({super.key, required this.text});

  final ExpandTextController controller = Get.put(ExpandTextController());

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      var textWidget = Text(
        text,
        maxLines: controller.isExpanded.value ? null : 3,
        overflow: controller.isExpanded.value
            ? TextOverflow.visible
            : TextOverflow.ellipsis,
      );
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget,
        GestureDetector(
          onTap: controller.toggleExpanded,
          child: Text(
            controller.isExpanded.value ? "Show less" : "Show more",
            style: AppStyle.headline1,
          ),
        )
      ],
    );
    });
  }
}
