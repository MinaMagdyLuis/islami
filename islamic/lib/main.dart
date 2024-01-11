import 'package:flutter/material.dart';
import 'package:islamic/chapter_details_screen/chapter_details_screen.dart';
import 'package:islamic/hadeth_details/hadeth_details_screen.dart';
import 'package:islamic/home_screen.dart';
import 'package:islamic/myThemeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => const ChapterDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
