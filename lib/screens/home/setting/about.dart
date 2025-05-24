import 'package:GoTravel/custom/content.dart';
import 'package:flutter/material.dart';
import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart' show rootBundle;

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _About();
}

class _About extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 10),
          child: AppBar(
            title: Text(
              AppLocalizations.of(context)!.about_us,
              style: AppStyle.headTextBig.copyWith(
              ),
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Flexible(
                child: Text(
                  AppLocalizations.of(context)!.about_content,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                _showPrivacyPolicy(context,LongString.privacyPolicy);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      AppLocalizations.of(context)!.privacy_policy,
                      style: AppStyle.headTextSmall.copyWith(
                          fontSize: 20
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: (){
                _showPrivacyPolicy(context,LongString.termAndCondition);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      AppLocalizations.of(context)!.terms_and_conditions,
                      style: AppStyle.headTextSmall.copyWith(
                          fontSize: 20
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<dynamic> _showPrivacyPolicy(BuildContext context,String data) async {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20)
          ),
        ),
        builder: (BuildContext context){
          return SingleChildScrollView(
              child: Html(data: data)
          );
        }
    );
  }
}
