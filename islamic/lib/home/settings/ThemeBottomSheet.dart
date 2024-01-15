import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
              settingsProvider.changeTheme(ThemeMode.light);
              Navigator.of(context).pop();
            },
            child: settingsProvider.isDarkEnabled()
                ? showUnselectedItem(
                    AppLocalizations.of(context)!.light,
                  )
                : showSelectedItem(AppLocalizations.of(context)!.light),
          ),
          InkWell(
            onTap: () {
              settingsProvider.changeTheme(ThemeMode.dark);
              Navigator.of(context).pop();
            },
            child: settingsProvider.isDarkEnabled()
                ? showSelectedItem(
                    AppLocalizations.of(context)!.dark,
                  )
                : showUnselectedItem(AppLocalizations.of(context)!.dark),
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
