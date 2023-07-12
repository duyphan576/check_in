import 'package:check_in/models/student/students.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.students, required this.token});
  final Students students;
  final String token;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('My Profile'),
        //   actions: [
        //     InkWell(
        //       onTap: () {
        //         //send report to school management, in case if you want some changes to your profile
        //       },
        //       child: Container(
        //         padding: EdgeInsets.only(right: 5),
        //         child: Row(
        //           children: [
        //             Icon(Icons.report_gmailerrorred_outlined),
        //             SizedBox(
        //               height: 10,
        //             ),
        //             Text(
        //               'Report',
        //               style: Theme.of(context).textTheme.titleSmall,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/images/student_profile.jpeg'),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Aisha Mirza',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text('Class X-II A | Roll no: 12',
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'Registration Number', value: '2020-ASDF-2021'),
                  ProfileDetailRow(title: 'Academic Year', value: '2020-2021'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(title: 'Admission Class', value: 'X-II'),
                  ProfileDetailRow(title: 'Admission Number', value: '000126'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'Date of Admission', value: '1 Aug, 2020'),
                  ProfileDetailRow(title: 'Date of Birth', value: '3 May 1998'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ProfileDetailColumn(
                title: 'Email',
                value: 'aisha12@gmail.com',
              ),
              ProfileDetailColumn(
                title: 'Father Name',
                value: 'John Mirza',
              ),
              ProfileDetailColumn(
                title: 'Mother Name',
                value: 'Angelica Mirza',
              ),
              ProfileDetailColumn(
                title: 'Phone Number',
                value: '+923066666666',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 9,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(value, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 10,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 11,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(value, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 10,
          ),
        ],
      ),
    );
  }
}
