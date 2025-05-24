import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Passengers extends StatefulWidget {
  const Passengers({super.key});

  @override
  State<Passengers> createState() => _Passengers();
}

class _Passengers extends State<Passengers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 10),
          child: AppBar(
            title: Text(
              AppLocalizations.of(context)!.passenger,
              style: AppStyle.headTextBig.copyWith(

              ),
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
