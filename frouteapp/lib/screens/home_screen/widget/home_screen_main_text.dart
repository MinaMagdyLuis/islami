import 'package:flutter/material.dart';

class HomeScreenMainText extends StatelessWidget {
  final String text;

  const HomeScreenMainText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xffa13ed9),
            Color(0xff7b2fa5),
            Color(0xff7b2fa5),
          ],
        )),
        child: Text(
          text,

          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
