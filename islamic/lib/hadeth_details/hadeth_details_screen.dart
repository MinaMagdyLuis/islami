import 'package:flutter/material.dart';

import '../hadeth/hadeth_tab.dart';
import '../myThemeData.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadethRoute';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SingleHadethData content =
        ModalRoute.of(context)!.settings.arguments as SingleHadethData;
    List<String> lines = content.content.split('\n');
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
        appBar: AppBar(
          title: Text(content.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SingleChildScrollView(
                    child: Text(
                      content.content,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
