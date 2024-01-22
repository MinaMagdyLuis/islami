import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counterTasbeh = 1, counterAzkar = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    List<String> azkar = [
      AppLocalizations.of(context)!.sobhan_allah,
      AppLocalizations.of(context)!.elhamd_llah,
      AppLocalizations.of(context)!.allah_akba,
      AppLocalizations.of(context)!.la_elallah_el_allah,
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 75),
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Transform.rotate(
                angle: angle,
                child: GestureDetector(
                  onTap: onTasbehClick,
                  child: Image.asset(
                    settingsProvider.isDarkEnabled()
                        ? 'assets/images/body of seb7a_dark.png'
                        : 'assets/images/body of seb7a.png',
                    width: width * 0.5,
                    height: height * 0.25,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: -64,
                right: 25,
                child: Image.asset(
                  settingsProvider.isDarkEnabled()
                      ? 'assets/images/head of seb7a_dark.png'
                      : 'assets/images/head of seb7a.png',
                  width: width * 0.2,
                  height: height * 0.1,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.tasbeh_number,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: 69,
            height: 81,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              counterTasbeh.toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: onTasbehClick,
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(
              azkar[counterAzkar],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  void onTasbehClick() {
    if (counterTasbeh < 33) {
      counterTasbeh++;
    } else {
      if (counterAzkar < 4) {
        counterAzkar++;
      } else {
        counterAzkar = 0;
      }

      counterTasbeh = 1;
    }

    angle += 15;
    setState(() {});
  }
}
