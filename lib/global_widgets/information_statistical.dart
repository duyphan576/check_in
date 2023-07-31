import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Grade F is a grade from 0 to less than 4"),
            Text("Grade D is a grade from 4 to less than 5,5"),
            Text("Grade C is a grade from 5,5 to less than 7 "),
            Text("Grade B is a grade from 7 to less than 8,5"),
            Text("Grade A is a grade 8.5 or higher"),
          ]),
    );
  }
}
