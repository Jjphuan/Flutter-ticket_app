import 'package:GoTravel/base/utils/all_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/res/media.dart';
import 'package:GoTravel/base/widgets/app_double_text.dart';
import 'package:GoTravel/screens/search/widgets/search_button.dart';
import 'package:GoTravel/screens/search/widgets/search_field.dart';
import 'package:GoTravel/screens/search/widgets/search_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'dart:math' as math;

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreen();
}

class _HelpScreen extends State<HelpScreen> with SingleTickerProviderStateMixin{
  late List<bool> isOpenList;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    isOpenList = List.filled(questionList.length, false);
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rotate() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final helpList = getHelpList(context);

    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 16),
          child: AppBar(
            title: Text(
              AppLocalizations.of(context)!.help_center,
              style: AppStyle.headTextBig.copyWith(
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 1
              ),
            ),
          ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                  AppLocalizations.of(context)!.can_help_you,
                style: AppStyle.headTextBig.copyWith(
                  fontSize: 22
                ),
              ),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: List.generate(helpList.length, (index) {
                  final currentHelp = helpList[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        spreadRadius: 1
                      )]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentHelp['icon'],
                        Text(
                          currentHelp['name'],
                          style: AppStyle.headTextSmall.copyWith(
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                  );
                  }
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 18),
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 2),
                      blurRadius: 4,
                      spreadRadius: 1
                  )]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.look_something_else,
                      style: AppStyle.headTextSmall.copyWith(
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: questionList.length,
                      itemBuilder: (context,index){
                        final _questionList = questionList[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  isOpenList[index] = !isOpenList[index];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: EdgeInsets.only(bottom: isOpenList[index] ? 0 : 15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: isOpenList[index] ?
                                        const BorderRadius.only(
                                          topLeft: Radius.circular(6),
                                          topRight: Radius.circular(6),
                                        ) :
                                        BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 2,
                                        spreadRadius: 0.5
                                    )
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        _questionList['question'],
                                       style: AppStyle.headTextSmall.copyWith(
                                         fontSize: 18,
                                         fontWeight: FontWeight.w400
                                       ),
                                    ),
                                    Transform.rotate(
                                        angle: isOpenList[index] ? math.pi : 0,
                                        child: Icon(Icons.keyboard_arrow_up),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if(isOpenList[index]) Container(
                              padding: const EdgeInsets.all(12.0),
                              margin: EdgeInsets.only(bottom: isOpenList[index] ? 15 : 0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: isOpenList[index] ?
                                  const BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ) :
                                  BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 2,
                                        spreadRadius: 0.5
                                    )
                                  ]
                              ),
                              child: Text(
                                _questionList['answers'],
                                style: AppStyle.headTextSmall.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}