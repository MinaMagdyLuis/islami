import 'package:flutter/material.dart';

class MyThemeData {
  static bool isDarkTheme = true;
  static const Color lightPrimary = Color(0xFFB7935F);

  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color darkSecondary = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 25,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 25,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      dividerColor: lightPrimary,
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
          seedColor: lightPrimary,
          primary: lightPrimary,
          onPrimary: Colors.white,
          secondary: const Color(0x87B7935F),
          onSecondary: Colors.black,
          background: Colors.white),
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: Colors.black,
          size: 32,
        ),
        unselectedIconTheme: IconThemeData(),
        selectedItemColor: darkPrimary,
        unselectedItemColor: Colors.white,
      ));
  static ThemeData darkTheme = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: darkPrimary,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 25,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontSize: 25,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    cardTheme: CardTheme(
        color: darkPrimary,
        surfaceTintColor: Colors.transparent,
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
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimary,
      primary: darkPrimary,
      onPrimary: Colors.white,
      secondary: darkSecondary,
      onSecondary: Colors.white,
      background: darkPrimary,
    ),
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: darkSecondary,
        size: 32,
      ),
      selectedLabelStyle: TextStyle(color: darkSecondary, fontSize: 22),
      selectedItemColor: darkSecondary,
      unselectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(color: Colors.white),
    ),
    dividerColor: darkSecondary,
  );
}
