import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/classroom/classroom_view.dart';
import 'package:check_in/modules/profile/views/profile_view.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/student_data.dart';

class HomeView extends StatefulWidget {
  // const HomeView({super.key, required this.students, required this.token});
  // final Students students;
  // final String token;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  var token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onInit();
  }

  onInit() async {
    token = await cacheGet(CacheManagerKey.TOKEN);
    print(token);
  }

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
                      // Text(widget.students.fullname.toString()),
                    ]),
              ),
              ListTile(
                title: const Text("Check in"),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text("Classroom"),
                onTap: () {
                  // Get.to(ClassroomView(
                  // token: widget.token,
                  // ));
                },
              ),
              ListTile(
                title: const Text("Grade"),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text("Document"),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text("Profile"),
                onTap: () {
                  //   Get.to(ProfileView(
                  //       students: widget.students, token: widget.token));
                },
              ),
              ListTile(
                title: const Text("Logout"),
                onTap: () {},
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
                            // StudentName(
                            //   studentName: widget.students.fullname.toString(),
                            // ),
                            // StudentCode(code: widget.students.code!),
                            // StudentBirthdate(
                            //     studentBirthdate: widget.students.birthdate!),
                          ],
                        ),
                        StudentPicture(
                            picAddress: 'assets/images/OIG.jpg',
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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                                Text(
                                  "Check in",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(ClassroomView(
                          //   token: widget.token,
                          // ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.class_,
                                  size: 30,
                                ),
                                Text(
                                  "Classroom",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.grade,
                                  size: 30,
                                ),
                                Text(
                                  "Grade",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
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
                              children: [
                                Icon(
                                  Icons.storage,
                                  size: 30,
                                ),
                                Text(
                                  "Document",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(ProfileView(
                          //     students: widget.students, token: widget.token));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 30,
                                ),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ]),
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
