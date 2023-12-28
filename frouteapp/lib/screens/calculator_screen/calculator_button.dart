import 'package:flutter/material.dart';

typedef onCalcultorClickCallBack = void Function(String mina);

class CalculatorButton extends StatelessWidget {
  onCalcultorClickCallBack onButtonClickCallback;
  String text;
  int flex;

  CalculatorButton({
    required this.text,
    super.key,
    this.flex = 1,
    required this.onButtonClickCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          child: Text(text),
          onPressed: () {
            onButtonClickCallback(text);
          },
        ),
      ),
    );
  }
}
