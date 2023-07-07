import 'package:flutter/material.dart';
import 'widgets/student_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                          studentName: 'Aisha',
                        ),
                        StudentClass(
                            studentClass: 'Class X-II A | Roll no: 12'),
                        StudentYear(studentYear: '2020-2021'),
                      ],
                    ),
                    StudentPicture(
                        picAddress: 'assets/images/student_profile.jpeg',
                        onPress: () {
                          // go to profile detail screen here
                          // Navigator.pushNamed(
                          //     context, MyProfileScreen.routeName);
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      onPress: () {
                        //go to attendance screen
                      },
                      title: 'Attendance',
                      value: '90.02%',
                    ),
                    StudentDataCard(
                      onPress: () {
                        //go to fee due screen
                        // Navigator.pushNamed(context, FeeScreen.routeName);
                      },
                      title: 'Fees Due',
                      value: '600\$',
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
