import 'package:check_in/models/student/students.dart';
import 'package:flutter/material.dart';
import 'widgets/student_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.students});
  final Students students;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/student_profile.jpeg'),
                        ),
                      ),
                      Text(students.fullname.toString()),
                    ]),
              ),
              ListTile(
                title: const Text("Test"),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text("Test"),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StudentName(
                              studentName: students.fullname.toString(),
                            ),
                            StudentCode(code: students.code!),
                          ],
                        ),
                        StudentPicture(
                            picAddress: 'assets/images/student_profile.jpeg',
                            onPress: () {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Icon(Icons.abc), Text("test")]),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Icon(Icons.abc), Text("test")]),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Icon(Icons.abc), Text("test")]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Icon(Icons.abc), Text("test")]),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Icon(Icons.abc), Text("test")]),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Icon(Icons.abc), Text("test")]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
