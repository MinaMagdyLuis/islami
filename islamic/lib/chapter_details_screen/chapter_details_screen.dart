import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/quran/verses_widget.dart';

import '../myThemeData.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = 'ChapterDetails';

  const ChapterDetailsScreen({
    super.key,
  });

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  List verses = [];

  @override
  Widget build(BuildContext context) {
    final chapterDetailsArgs =
        ModalRoute.of(context)!.settings.arguments as ChapterDetailsArgs;

    if (verses.isEmpty) {
      loadFiles(chapterDetailsArgs.index);

    }
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
          title: Text(chapterDetailsArgs.title),
        ),
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(
                        color: Theme.of(context).dividerColor,
                        width: double.infinity,
                        height: 3,
                      );
                    },
                    itemBuilder: (context, index) {
                      return VersesWidget(title: verses[index], index: index);
                    },
                    itemCount: verses.length,
                  ),
                ),
              ),
      ),
    );
  }

  void loadFiles(index) async {
    String loadedFiles =
        await rootBundle.loadString('assets/files/${index + 1}.txt');

    setState(() {
      verses = loadedFiles.split('\n');
    });
  }
}

class ChapterDetailsArgs {
  final String title;
  final int index;

  const ChapterDetailsArgs({required this.title, required this.index});
}
