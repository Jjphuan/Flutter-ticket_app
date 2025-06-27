import 'dart:convert';

import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/base/widgets/showDialog.dart';
import 'package:GoTravel/custom/endpoint.dart';
import 'package:GoTravel/custom/http_parse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegisterProvider extends ChangeNotifier{
  bool _loginSuccess = false;

  Future<void> checkLoginToken(BuildContext context)async {
    try{
      Response response = await HttpParse().post(
        Endpoint.checkToken
      );
      final prefs = await SharedPreferences.getInstance();
      final data = response.data;

      prefs.setString('id', data['id'].toString());
      prefs.setBool('isLogin',true);
      prefs.setString('name', data['username']);
      prefs.setString('email', data['email']);
      prefs.setString('phone_number', data['phone_number']);
      prefs.setString('register_at', data['created_at']);
      prefs.setString('token', data['token']);

    }catch(err){
      String errorMessage = 'Unknown error';

      if (err is DioException) {
        if(err.response?.statusCode == 401){
          final prefs = await SharedPreferences.getInstance();
          prefs.remove('token');
          prefs.remove('isLogin');

        }else{
          errorMessage = HttpParse.handleErrorMessage(err);

          if(context.mounted){
            showCustomDialog(
                context,
                AppLocalizations.of(context)!.register_failed,
                errorMessage
            );
          }
        }
      }

    }
  }

  Future<void> register(
      BuildContext context,
      String name,
      String phone_num,
      String email,
      String password
  )async {

    try{
      Response response = await HttpParse().post(
        Endpoint.register,
        {
          'name': name,
          'phone_num': phone_num,
          'email': email,
          'password': password
        }
      );

      if(response.data['success']){

        final data = response.data['result'];
        final prefs = await SharedPreferences.getInstance();
        _loginSuccess = true;

        prefs.setString('id', data['id'].toString());
        prefs.setBool('isLogin',true);
        prefs.setString('name', data['username']);
        prefs.setString('email', data['email']);
        prefs.setString('phone_number', data['phone_number']);
        prefs.setString('register_at', data['created_at']);
        prefs.setString('token', response.data['token']);
      }
      if(context.mounted){
        context.go('/');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 5,
            behavior: SnackBarBehavior.floating,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
            content: Text(
              AppLocalizations.of(context)!.register_success,
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

    }catch(err){
      String errorMessage = 'Unknown error';

      if (err is DioException) {
        errorMessage = HttpParse.handleErrorMessage(err);
      }

      if(context.mounted){
        showCustomDialog(
            context,
            AppLocalizations.of(context)!.register_failed,
            errorMessage
        );
      }
    }
  }

  Future<void> login(BuildContext context, String email, String password)async{
    _loginSuccess = false;

    Map<String,dynamic> body = {
      'email': email,
      'password': password
    };
    print(body);

    try{
      Response response = await HttpParse().post(
        Endpoint.login,
        body
      );

      if(response.data['success']){
        final prefs = await SharedPreferences.getInstance();
        final data = response.data;

        _loginSuccess = true;

        prefs.setString('id', data['id'].toString());
        prefs.setBool('isLogin',true);
        prefs.setString('token', response.data['token']);
      }


      if(context.mounted) {
        context.go('/');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 5,
            behavior: SnackBarBehavior.floating,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
            content: Text(
              AppLocalizations.of(context)!.login_success,
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

  bool get loginSuccess => _loginSuccess;
}








