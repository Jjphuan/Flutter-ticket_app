import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier{
  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('locale');
    if (langCode != null) {
      _locale = Locale(langCode);
      notifyListeners();
    }else{
      _locale = const Locale('en');
    }
  }

  void setLocale(String locale) async{
    if(!AppLocalizations.supportedLocales.contains(Locale(locale))) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale);
    _locale = Locale(locale);
    notifyListeners();
  }
}