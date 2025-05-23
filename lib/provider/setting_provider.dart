import 'package:GoTravel/base/widgets/showDialog.dart';
import 'package:GoTravel/custom/endpoint.dart';
import 'package:GoTravel/custom/http_parse.dart';
import 'package:GoTravel/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SettingProvider extends ChangeNotifier{
  final LocaleProvider localeProvider = LocaleProvider();

  List<dynamic> _settingList = [];

  Future<void> getSettingList(BuildContext context) async {

    try {
      Response response = await  HttpParse().get(
          Endpoint.getSetting,
      );

      if (response.data['success'] == true) {
        _settingList = response.data['data'];
        // print(response);
        notifyListeners();
      }else{
        showCustomDialog(
            context,
            AppLocalizations.of(context)!.load_failed,
            AppLocalizations.of(context)!.not_data
        );
      }
    } catch (e) {
      print('Error getting settings: $e');
    }
  }

  List<dynamic> get settingList => _settingList;

}