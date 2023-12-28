import 'package:flutter/material.dart';
import 'package:islamic/chapter_details_screen/chapter_details_screen.dart';

class VersesWidget extends StatelessWidget {
  final String title;
  final int index;

  const VersesWidget(
      {super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(8) ,

      alignment: Alignment.center,
      child: Text(
        textDirection: TextDirection.rtl,
        ' $title ${{index+1}}',
        style: TextStyle(fontFamily: 'Schyler', fontSize: 20),
      ),
    );
  }
}
