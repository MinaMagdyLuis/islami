import 'package:flutter/material.dart';
import 'package:islamic/hadeth/hadeth_tab.dart';
import 'package:islamic/home/settings/settings_tab.dart';
import 'package:islamic/quran/quran_tab.dart';
import 'package:islamic/radio/radio_tab.dart';
import 'package:islamic/tasbeh/tasneh_tab.dart';

import 'myThemeData.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> bodyWidgets = [
    const RadioTab(),
    const TasbehTab(),
    const HadethTab(),
    QuranTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                MyThemeData.isDarkTheme
                    ? 'assets/images/main_background_dark.jpg'
                    : 'assets/images/main_background.png',
              ),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          body: bodyWidgets[selectedIndex],
          appBar: AppBar(title: Text('Islamic')),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Image.asset('assets/images/radio.png'),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Image.asset('assets/images/sebha.png'),
                    label: 'Tasbeh'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Image.asset('assets/images/moshaf.png'),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Image.asset('assets/images/quran.png'),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: const Icon(Icons.settings),
                    label: 'Settings'),
              ]),
        ));
  }
}
