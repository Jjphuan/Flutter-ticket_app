import 'package:GoTravel/provider/help_provider.dart';
import 'package:GoTravel/provider/home_provider.dart';
import 'package:GoTravel/provider/locale_provider.dart';
import 'package:GoTravel/provider/login_register_provider.dart';
import 'package:GoTravel/provider/setting_provider.dart';
import 'package:GoTravel/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure async before runApp

  final localeProvider = LocaleProvider();
  await localeProvider.loadLocale(); // Load locale before app starts

  runApp(MyApp(localeProvider: localeProvider));
}

class MyApp extends StatefulWidget {
  final LocaleProvider localeProvider;
  const MyApp({super.key, required this.localeProvider});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
// class _MyAppState extends State<MyApp> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
  }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //
  //   switch (state) {
  //     case AppLifecycleState.detached:
  //     // App is about to be terminated
  //       _onAppTerminated();
  //       break;
  //     case AppLifecycleState.paused:
  //     // App is in background
  //       _clearSearch();
  //       break;
  //     case AppLifecycleState.resumed:
  //     // App is back in foreground
  //       break;
  //     case AppLifecycleState.inactive:
  //     // App is inactive (e.g., phone call, system dialog)
  //       break;
  //     case AppLifecycleState.hidden:
  //     // App is hidden
  //       break;
  //   }
  // }
  //
  // void _onAppTerminated() {
  //   _clearSearch();
  // }
  //
  // void _clearSearch() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('from');
  //   await prefs.remove('to');
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
            ChangeNotifierProvider.value(
            value: widget.localeProvider,
          ),
          ChangeNotifierProvider(create: (_) => SettingProvider()),
          ChangeNotifierProvider(create: (_) => LoginRegisterProvider()),
          ChangeNotifierProvider(create: (_) => HelpProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
      child: Consumer<LocaleProvider>(
        builder: (context, provider, child) {
          return MaterialApp.router(
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: provider.locale,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
