import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  static final String pageName='SecondScreen';
 final String title;
  const SecondScreen({super.key, required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
    );
  }
}
