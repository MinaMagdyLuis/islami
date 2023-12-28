import 'package:flutter/material.dart';

import 'couse_data_model.dart';

class CourseItem extends StatelessWidget {
  final CourseDataModel courseDataModel;

  const CourseItem({super.key, required this.courseDataModel});

  @override
  Widget build(BuildContext context) {
    return Stack(

      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(courseDataModel.image,fit: BoxFit.fill,

        ),
        Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              courseDataModel.text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),

        ),

      ],

    );
  }
}
