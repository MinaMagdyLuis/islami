import 'package:courses/course_item.dart';
import 'package:courses/couse_data_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static const String homePageName = 'my-home-page';
  List<CourseDataModel> dataModles=[];
   MyHomePage({super.key}){
      dataModles=[
       CourseDataModel(text: 'Android Course ', image: 'assets/Android.jpeg'),
       CourseDataModel(text: 'Ios Course ', image: 'assets/IOS.jpeg'),
       CourseDataModel(text: 'Full Stack ', image: 'assets/fullStack.jpeg'),

     ];
   }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CourseItem(courseDataModel: widget.dataModles[index]);
        },
        itemCount: 3,
      ),
    );
  }
}
