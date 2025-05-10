import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 14),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.grey,
            title: Text(
              AppLocalizations.of(context)!.setting,
              style: AppStyle.headTextBig.copyWith(
                color: Colors.white,
                letterSpacing: 1
              ),
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ...List.generate(
                1, (index){
                  return GestureDetector(
                    onTap: (){
                      context.go('/profile/setting/change_language');
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(1, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.change_language,
                        style: AppStyle.headTextSmall,
                      )
                    ),
                  );
              }
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
