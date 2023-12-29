import 'package:flutter/material.dart';
import 'package:islamic/hadeth/hadeth_tab.dart';
import 'package:islamic/hadeth_details/hadeth_details_screen.dart';

class HadethTitleWidget extends StatelessWidget {
  final SingleHadethData hadethData;

  const HadethTitleWidget({
    super.key,
    required this.hadethData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
            arguments: SingleHadethData(
                title: hadethData.title, content: hadethData.content));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          hadethData.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
