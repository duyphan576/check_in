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
        appBar: AppBar(
          title: Text('My Profile'),
          actions: [],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/OIG.jpg'),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          students.fullname.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(students.code.toString(),
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
                      title: 'Family Mid Name',
                      value: students.famMidName.toString()),
                  ProfileDetailRow(
                      title: 'Name', value: students.name.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(
                      title: 'Gender', value: students.gender.toString()),
                  ProfileDetailRow(
                      title: 'Date of Birth',
                      value: students.birthdate.toString()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ProfileDetailColumn(
                title: 'Email',
                value: students.email.toString(),
              ),
              ProfileDetailColumn(
                title: 'Phone Number',
                value: students.phone.toString(),
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
