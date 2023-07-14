import 'package:check_in/constants/app_string.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftDrawer extends GetView<HomeController> {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  Text(controller.userData["fullname"]),
                ]),
          ),
          ListTile(
            title: const Text(HomeString.CHECK_IN),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text(HomeString.CLASSROOM),
            onTap: () {
              // Get.to(ClassroomView(
              //   token: token,
              // ));
            },
          ),
          ListTile(
            title: const Text(HomeString.GRADE),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text(HomeString.DOCUMENT),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text(HomeString.PROFILE),
            onTap: () {
              // Get.to(ProfileView(students: students, token: token));
            },
          ),
          ListTile(
            title: const Text(HomeString.PROFILE),
            onTap: () {
              // Update the state of the app.
              // ...
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
