import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/chapter_details_screen/chapter_details_screen.dart';
import 'package:islamic/data/shared_helper.dart';
import 'package:islamic/hadeth_details/hadeth_details_screen.dart';
import 'package:islamic/home_screen.dart';
import 'package:islamic/myThemeData.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper.prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider<SettingsProvider>(
      create: (BuildContext context) {
        return SettingsProvider()..init();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Islami",
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: settingsProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => const ChapterDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(settingsProvider.currentLanguage),
    );
  }
}
