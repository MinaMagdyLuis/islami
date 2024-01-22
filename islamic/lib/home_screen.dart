import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/hadeth/hadeth_tab.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:islamic/quran/quran_tab.dart';
import 'package:islamic/radio/radio_tab.dart';
import 'package:islamic/tasbeh/tasbeh_tab.dart';
import 'package:provider/provider.dart';

import 'home/settings/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> bodyWidgets = [
    QuranTab(),
    const HadethTab(),
    const TasbehTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                settingsProvider.getBackgroundImage(),
              ),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          body: bodyWidgets[selectedIndex],
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.app_name)),
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
                    icon: Image.asset('assets/images/quran.png'),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Image.asset('assets/images/moshaf.png'),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Image.asset('assets/images/sebha.png'),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Image.asset('assets/images/radio.png'),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ]),
        ));
  }
}
