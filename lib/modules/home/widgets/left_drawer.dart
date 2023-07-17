import 'package:check_in/constants/app_string.dart';
import 'package:check_in/constants/index.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
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
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF41D8D7),
                    Color(0xFF21A3C6),
                    Color(0xFF285DA2),
                    Color(0xFF332F61),
                    Color(0xFF452E51),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
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
                    Text(
                      controller.userData["fullname"],
                      style: TextStyle(
                        color: AppColors.lightWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ]),
            ),
          ),
          ListTile(
            title: Text(
              HomeString.CHECK_IN,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              HomeString.CLASSROOM,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Get.to(ClassroomView(
              //   token: token,
              // ));
            },
          ),
          ListTile(
            title: Text(
              HomeString.GRADE,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              HomeString.DOCUMENT,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              HomeString.PROFILE,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Get.to(ProfileView(students: students, token: token));
            },
          ),
          ListTile(
            title: Text(
              HomeString.PROFILE,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
