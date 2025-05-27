import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 10),
          child: AppBar(
            title: Text(
              AppLocalizations.of(context)!.personal_information,
              style: AppStyle.headTextBig.copyWith(

              ),
            ),
          )
      ),
    );
  }
}
