import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/provider/setting_provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool loading = false;

  @override
  void initState() {
    _getSettingList();
    super.initState();
  }

  void _getSettingList ()async{
    final provider = Provider.of<SettingProvider>(context,listen: false);
    setState(() {
      loading = true;
    });
    await provider.getSettingList(context);
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context,listen: true);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 16),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.grey,
            title: Text(
              AppLocalizations.of(context)!.setting,
              style: AppStyle.headTextBig.copyWith(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1
              ),
            ),
          )
      ),
      body: (!loading) ? SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ...List.generate(
                provider.settingList.length, (index){
                  final currentData = provider.settingList[index];

                  return GestureDetector(
                    onTap: () async{
                      await context.push('/profile/setting/${currentData['route_name']}');
                      _getSettingList();
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
                        currentData['name'],
                        style: AppStyle.headTextSmall,
                      )
                    ),
                  );
              }
            ),
            const SizedBox(height: 20),
          ],
        )
      ): Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.grey,
          size: 100,
        ),
      ),
    );
  }
}
