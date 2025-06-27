import 'package:GoTravel/base/widgets/showDialog.dart';
import 'package:GoTravel/custom/endpoint.dart';
import 'package:GoTravel/custom/http_parse.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SettingProvider extends ChangeNotifier{

  Future<void> logout(BuildContext context) async{
    try{
      Response response = await HttpParse().post(
          Endpoint.logout
      );

      if(response.data['success'] == true){
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('id');
        prefs.setBool('isLogin',false);
        prefs.remove('name');
        prefs.remove('email');
        prefs.remove('phone_number');
        prefs.remove('register_at');
        prefs.remove('token');
        if(context.mounted){
          context.pop();
        }
      }

      notifyListeners();

    }catch(err){
      String errorMessage = 'Unknown Message';

      if(err is DioException){
        errorMessage = HttpParse.handleErrorMessage(err);
      }

      if(context.mounted){
        showCustomDialog(
            context,
            AppLocalizations.of(context)!.login_failed,
            errorMessage
        );
      }
    }
  }

}