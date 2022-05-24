import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qazonamozlar/config/routes/my_route.dart';
import 'package:qazonamozlar/config/theme/main_theme.dart';
import 'package:qazonamozlar/screens/authentication/view/mainsign/main_sign.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
      ],
      // saveLocale: true,
      fallbackLocale: Locale('uz', 'UZ'),
      path: "assets/lang"));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qazo namozlar',
      theme: AppTheme.apptheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // home: MainSign(),
      initialRoute: '/onBoard',
      onGenerateRoute: (s) => MyRoutes.instance.ongenerateRoute(s),
    );
  }
}
