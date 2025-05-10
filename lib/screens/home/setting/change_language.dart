import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/base/res/Style/app_style.dart';
import 'package:ticket_app/provider/locale_provider.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  final languageList = AppLocalizations.supportedLocales;

  @override
  Widget build(BuildContext context) {

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

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 14),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.grey,
            title: Text(
              AppLocalizations.of(context)!.change_language,
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
                languageList.length, (index){
              return GestureDetector(
                onTap: (){
                  final localeProvider = Provider.of<LocaleProvider>(context,listen: false);
                  setState(() {
                    localeProvider.setLocale(newlanguageList[index]['locale']!);
                  });
                },
                child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 15),
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
                      "${newlanguageList[index]['code']}",
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
