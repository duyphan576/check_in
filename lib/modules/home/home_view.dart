import 'package:check_in/models/student/students.dart';
import 'package:flutter/material.dart';
import 'widgets/student_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({required this.students});
  final Students students;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          studentName: students.fullname.toString(),
                        ),
                      ],
                    ),
                    StudentPicture(
                        picAddress: 'assets/images/student_profile.jpeg',
                        onPress: () {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
