import 'package:flutter/material.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              settingsProvider.changeLanguage('en');
              Navigator.of(context).pop();
            },
            child: settingsProvider.isEnglishEnabled()
                ? showSelectedItem("English")
                : showUnselectedItem("English"),
          ),
          InkWell(
            onTap: () {
              settingsProvider.changeLanguage('ar');
              Navigator.of(context).pop();
            },
            child: settingsProvider.isEnglishEnabled()
                ? showUnselectedItem("العربية")
                : showSelectedItem("العربية"),
          ),
        ],
      ),
    );
  }

  Widget showSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        Icon(Icons.check, color: Theme.of(context).colorScheme.secondary),
      ],
    );
  }

  Widget showUnselectedItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
