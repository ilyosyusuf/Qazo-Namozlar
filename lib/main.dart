import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qazonamozlar/config/routes/theme/main_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      //saveLocale: true,
      fallbackLocale: Locale('en', 'US'),
      path: "assets/lang"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.apptheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
