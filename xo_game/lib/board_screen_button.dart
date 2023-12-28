import 'package:flutter/material.dart';

typedef boardScreenCallbackClick = void Function(String text,int index);

class BoardScreenButton extends StatelessWidget {
 final boardScreenCallbackClick onBoardScreenButtonClick;
 final String text;
 final int index;

  const BoardScreenButton({required this.onBoardScreenButtonClick, super.key, required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: () {
          onBoardScreenButtonClick(text,index);
        },
        child: Text(text),
      ),
    );
  }
}
