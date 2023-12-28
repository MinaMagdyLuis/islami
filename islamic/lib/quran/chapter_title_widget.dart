import 'package:flutter/material.dart';
import 'package:islamic/chapter_details_screen/chapter_details_screen.dart';

class ChapterTitleWidget extends StatelessWidget {
  final String title;
  final int index;

  const ChapterTitleWidget(
      {super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ChapterDetailsScreen.routeName,
            arguments: ChapterDetailsArgs(
              title: title,
              index: index,
            ));
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(fontFamily: 'Schyler', fontSize: 25),
        ),
      ),
    );
  }
}
