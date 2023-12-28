import 'package:flutter/material.dart';
import 'package:frouteapp/screens/home_screen/category.dart';

import 'widget/category_item.dart';


class HomeScreen extends StatelessWidget {
 final List<Category> categories=[];
   HomeScreen({super.key}){
    for(int i=0; i<100; i++){
      categories.add(Category(title: ' category $i',image: 'assets/images/الاقتصاد.jpg'));
    };
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(

            children: categories.map((e) => CategoryItem(category: e)).toList(),
          ),
        ),
      ),
    );
  }
}
