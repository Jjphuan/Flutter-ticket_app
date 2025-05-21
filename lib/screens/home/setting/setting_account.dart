import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SettingAccount extends StatefulWidget {
  const SettingAccount({super.key});

  @override
  State<SettingAccount> createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 16),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.grey,
            title: Text(
              "account",
              style: AppStyle.headTextBig.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1
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
