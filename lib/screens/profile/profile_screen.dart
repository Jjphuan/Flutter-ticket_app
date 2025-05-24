import 'package:GoTravel/provider/locale_provider.dart';
import 'package:GoTravel/provider/setting_provider.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/res/media.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loading = true;

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
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      loading = false;
    });
  }

  Icon matchSettingIcon(int settingId){
    Icon icon = Icon(Icons.hourglass_empty);
    
    switch(settingId){
      case 1 :
        icon = Icon(Icons.person);
        break;
      case 2 :
        icon = Icon(Icons.people);
        break;
      case 3 :
        icon = Icon(Icons.language);
        break;
      case 4 :
        icon = Icon(Icons.info);
        break;
      case 5 :
        icon = Icon(Icons.call);
        break;
      case 6 :
        icon = Icon(Icons.settings);
        break;
    }

    return icon;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context,listen: true);

    return (!loading) ? Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            'assets/images/guest.png',
                            fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User",
                          style: AppStyle.headTextBig,
                        ),
                        Text(
                          "60123456789",
                          style: AppStyle.headTextSmaller.copyWith(
                              color: Colors.grey[600]
                          ),
                        ),
                        const SizedBox(height:5),
                        Text(
                          "${AppLocalizations.of(context)!.member_since} Nov 2018",
                          style: AppStyle.headTextSmaller.copyWith(
                              color: Colors.grey[600]
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              const SizedBox(height: 20),
              ...List.generate(
                  provider.settingList.length, (index){
                final currentData = provider.settingList[index];

                return GestureDetector(
                  onTap: () async{
                    if(currentData['setting_id'] == 3){
                      final isChange = await _languageShowBottomSheet(context,currentData['name']);
                      if(isChange){
                        _getSettingList();
                      }
                    }else if(currentData['setting_id'] == 5){
                      final isChange = await _contactShowBottomSheet(context,currentData['name']);
                      if(isChange){
                        _getSettingList();
                      }
                    }else if(currentData['setting_id'] == 6){
                      final isChange = await _accountShowBottomSheet(context,currentData['name']);
                      if(isChange){
                        _getSettingList();
                      }
                    } else{
                      await context.push('/profile/setting/${currentData['route_name']}');
                      _getSettingList();
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              matchSettingIcon(currentData['setting_id']),
                              const SizedBox(width: 6),
                              Text(
                                currentData['name'],
                                style: AppStyle.headTextSmall.copyWith(
                                  fontSize: 16
                                ),
                              )
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios,size: 16,)
                        ],
                      )
                  ),
                );
              }
              ),
              const SizedBox(height: 20),
            ],
          )
        ],
      ),
    ) : Column(
      children: [
        const SizedBox(height: 200),
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.blue,
            size: 100,
          ),
        ),
      ],
    );
  }

  Future<dynamic> _languageShowBottomSheet(BuildContext context,String title){
    const languageList = AppLocalizations.supportedLocales;
    List<Map<String, String>> newlanguageList = [];

    for (var locale in languageList) {
      switch (locale.languageCode) {
        case 'en':
          newlanguageList.add(
              {
                'locale': locale.languageCode,
                'code': AppLocalizations.of(context)!.english
              }
          );
          break;
        case 'zh':
          newlanguageList.add(
              {
                'locale': locale.languageCode,
                'code': AppLocalizations.of(context)!.chinese
              }
          );
          break;
      }
    }

    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20)
          ),
        ),
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    )
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: 350
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          title,
                          style: AppStyle.headTextSmall.copyWith(
                            fontSize: 25
                          ),
                        ),
                      ),
                      const Divider(height: 1,color: Colors.black,),
                      const SizedBox(height: 8),
                      Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                  growable: true,
                                  languageList.length, (index){
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        final localeProvider = Provider.of<LocaleProvider>(context,listen: false);
                                        setState(() {
                                          localeProvider.setLocale(newlanguageList[index]['locale']!);
                                        });
                                        context.pop(true);
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          margin: const EdgeInsets.all(12),
                                          padding: const EdgeInsets.symmetric(vertical: 5 ,horizontal: 15),
                                          color: Colors.white,
                                          child: Text(
                                            "${newlanguageList[index]['code']}",
                                            style: AppStyle.headTextSmall.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400
                                            ),
                                          )
                                      ),
                                    ),
                                    const Divider(height: 1,)
                                  ],
                                );
                              }
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                );
              }
          );
        }
    );
  }

  Future<dynamic> _contactShowBottomSheet(BuildContext context,String title){

    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20)
          ),
        ),
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20)
                      )
                  ),
                  constraints: const BoxConstraints(
                      maxHeight: 300
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          title,
                          style: AppStyle.headTextSmall.copyWith(
                              fontSize: 25
                          ),
                        ),
                      ),
                      const Divider(height: 1,color: Colors.black,),
                      const SizedBox(height: 8),
                      Column(
                        children:[
                          GestureDetector(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.email),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.email,
                                        style: AppStyle.headTextSmall.copyWith(
                                          fontSize:20
                                        ),
                                      ),
                                      Text(
                                        "Example@gamil.com",
                                        style: AppStyle.headTextSmall.copyWith(
                                          fontSize: 16,
                                          color: Colors.grey
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          GestureDetector(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.contact_num,
                                        style: AppStyle.headTextSmall.copyWith(
                                            fontSize:20
                                        ),
                                      ),
                                      Text(
                                        "+60123456789",
                                        style: AppStyle.headTextSmall.copyWith(
                                            fontSize: 16,
                                            color: Colors.grey
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
          );
        }
    );
  }

  Future<dynamic> _accountShowBottomSheet(BuildContext context,String title){

    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20)
          ),
        ),
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20)
                      )
                  ),
                  constraints: const BoxConstraints(
                      maxHeight: 300
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          title,
                          style: AppStyle.headTextSmall.copyWith(
                              fontSize: 25
                          ),
                        ),
                      ),
                      const Divider(height: 1,color: Colors.black,),
                      const SizedBox(height: 8),
                      Column(
                        children:[
                          GestureDetector(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(Icons.delete_forever,color: Colors.red,),
                                  const SizedBox(width: 15),
                                  Text(
                                    AppLocalizations.of(context)!.delete_account,
                                    style: AppStyle.headTextSmall.copyWith(
                                        fontSize:22,
                                        color: Colors.red
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          GestureDetector(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(Icons.logout),
                                  const SizedBox(width: 15),
                                  Text(
                                    AppLocalizations.of(context)!.log_out,
                                    style: AppStyle.headTextSmall.copyWith(
                                        fontSize:22
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
          );
        }
    );
  }
}