import 'package:flutter/material.dart';
import 'package:islamic/chapter_details_screen/chapter_details_screen.dart';
import 'package:islamic/hadeth_details/hadeth_details_screen.dart';
import 'package:islamic/home_screen.dart';
////test branche
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
      theme: ThemeData(
          cardTheme: CardTheme(
              surfaceTintColor: Colors.white,
              elevation: 18,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              )),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFB7935F),
            primary: const Color(0xFFB7935F),
            onPrimary: Colors.white,
            secondary: const Color(0x87B7935F),
            onSecondary: Colors.black,
          ),
          useMaterial3: true,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
              size: 32,
            ),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          )),
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => const ChapterDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
