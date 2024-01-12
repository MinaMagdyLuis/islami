import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/hadeth/hadeth_title_widget.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  State<HadethTab> createState() {
    return _HadethTabState();
  }
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (hadethData.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset('assets/images/hadeth_header_image.png')),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.hadeth,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: hadethData.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 48,
                      ),
                      color: Theme.of(context).colorScheme.primary,
                      width: double.infinity,
                      height: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return HadethTitleWidget(hadethData: hadethData[index]);
                  },
                  itemCount: hadethData.length),
        )
      ],
    );
  }

  List<SingleHadethData> hadethData = [];

  void loadFile() async {
    String loadedFile = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = loadedFile.trim().split('#');

    for (int i = 1; i < ahadethList.length; i++) {
      String singleHadeth = ahadethList[i];

      List<String> hadethLines = singleHadeth.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.remove(0);
      String content = hadethLines.join('\n');

      hadethData.add(SingleHadethData(title: title, content: content));
    }
    setState(() {});
  }
}

class SingleHadethData {
  final String title, content;

  SingleHadethData({required this.title, required this.content});
}
