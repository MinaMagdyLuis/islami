import 'package:flutter/material.dart';
import 'package:frouteapp/screens/home_screen/category.dart';
import 'package:frouteapp/screens/second_screen/second_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomRight,
        children: [
        Image.asset(category.image,
        height: 180, width: double.infinity, fit: BoxFit.fill),
    Container(
    width: 120,
    padding: const EdgeInsets.all(
    12,
    ),
    margin: const EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 8,
    ),
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
    child: TextButton(
    onPressed: () {
     Navigator.of(context).pushNamed(SecondScreen.pageName);

    },
    child: Text(
    category.title,
    textAlign: TextAlign.center,
    style: const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
    ),
    )
    ,
    ]
    ,
    );
  }
}
