import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/home/settings/LanguageBottomSheet.dart';
import 'package:islamic/home/settings/ThemeBottomSheet.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 68, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: showThemeBottomSheet,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border:
                    Border.all(width: 2, color: Theme.of(context).dividerColor),
              ),
              child: Text(
                  settingsProvider.currentTheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: showLanguageBottomSheet,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border:
                Border.all(width: 2, color: Theme.of(context).dividerColor),
              ),
              child: Text(
                  settingsProvider.currentLanguage == "en"
                      ? "English"
                      : "العربية",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }
}
