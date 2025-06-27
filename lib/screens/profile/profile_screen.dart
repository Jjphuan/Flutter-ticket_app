import 'package:GoTravel/base/utils/all_json.dart';
import 'package:GoTravel/custom/custom_utils.dart';
import 'package:GoTravel/provider/locale_provider.dart';
import 'package:GoTravel/provider/login_register_provider.dart';
import 'package:GoTravel/provider/setting_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/res/media.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool loading = false;
  bool isLogin = false;

  String username = '';
  String phone_num = '';
  String register_at = '';

  @override
  void initState() {
    _getInitVariable();
    super.initState();
  }

  void _getInitVariable()async{
    loading = true;
    if(loading){
      final prefs = await SharedPreferences.getInstance();
      final currentLang = prefs.getString('locale');
      final registerAtStr = prefs.getString('register_at');

      isLogin = prefs.getBool('isLogin') ?? false;
      username = prefs.getString('name') ?? '';
      final phone = prefs.getString('phone_number') ?? '';
      phone_num = phoneAddDash(phone);

      if (registerAtStr != null) {
        final date = DateTime.parse(registerAtStr);
        register_at = DateFormat.yMMMM(currentLang).format(date);
      } else {
        register_at = '';
      }


      setState(() {
        loading = false;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginRegisterProvider>(context,listen: true);

    if (loading) {
      return Column(
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
    return Scaffold(
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
                    (isLogin) ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: AppStyle.headTextBig,
                        ),
                        Text(
                          "+60 ${phone_num}",
                          style: AppStyle.headTextSmaller.copyWith(
                              color: Colors.grey[600]
                          ),
                        ),
                        const SizedBox(height:5),
                        Text(
                          "${AppLocalizations.of(context)!.member_since} $register_at",
                          style: AppStyle.headTextSmaller.copyWith(
                              color: Colors.grey[600]
                          ),
                        ),
                      ],
                    ) :
                    Text(
                      AppLocalizations.of(context)!.hi_guest,
                      style: AppStyle.headTextBig.copyWith(
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
          (isLogin) ? Column(
            children: [
              const SizedBox(height: 20),
              ...List.generate(
                  getSettingList(context).length, (index){
                  final currentData = getSettingList(context)[index];
                return GestureDetector(
                  onTap: () async{
                    if(currentData['id'] == 3){
                      final isChange = await _languageShowBottomSheet(context,currentData['name']);
                      if(isChange){
                        _getInitVariable();
                      }
                    }else if(currentData['id'] == 5){
                      final isChange = await _contactShowBottomSheet(context,currentData['name']);
                      if(isChange){

                      }
                    }else if(currentData['id'] == 6){
                      final isChange = await _accountShowBottomSheet(context,currentData['name']);
                    } else{
                      await context.push('/profile/${currentData['route']}');

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
                              currentData['icon'],
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
          ):
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.login_benefit,
                    style: AppStyle.headTextSmall
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () async{
                        await context.push('/profile/login_register');
                        _getInitVariable();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white, // text color
                        backgroundColor: Colors.blue,  // button background color
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                          AppLocalizations.of(context)!.login
                      )
                  )
                ],
              )
        ],
      ),
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
                  decoration: const BoxDecoration(
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
                            onTap: () async{
                              final provider = Provider.of<SettingProvider>(context,listen: false);

                              await provider.logout(context);
                              if(context.mounted){
                                context.go('/');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 5,
                                    behavior: SnackBarBehavior.floating,
                                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
                                    content: Text(
                                      AppLocalizations.of(context)!.logout_success,
                                      style: AppStyle.headTextSmaller.copyWith(
                                          color: Colors.white
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    duration: const Duration(seconds: 3),
                                    dismissDirection: DismissDirection.horizontal,
                                  ),
                                );
                              }
                            },
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