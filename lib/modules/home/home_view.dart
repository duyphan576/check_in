import 'package:check_in/constants/app_string.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/modules/home/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/student_data.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Scaffold(
                    appBar: AppBar(),
                    drawer: LeftDrawer(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StudentName(
                                          studentName:
                                              controller.userData["fullname"],
                                        ),
                                        StudentCode(
                                            code: controller.userData!["code"]
                                                    .toString() ??
                                                ""),
                                        StudentBirthdate(
                                            studentBirthdate: controller
                                                .userData["birthdate"]!),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check,
                                              size: 30,
                                            ),
                                            Text(
                                              HomeString.CHECK_IN,
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
                                      //   token: token,
                                      // ));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.class_,
                                              size: 30,
                                            ),
                                            Text(
                                              HomeString.CLASSROOM,
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
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.grade,
                                              size: 30,
                                            ),
                                            Text(
                                              HomeString.GRADE,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.storage,
                                              size: 30,
                                            ),
                                            Text(
                                              HomeString.DOCUMENT,
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
                                      //     students: students, token: token));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 30,
                                            ),
                                            Text(
                                              HomeString.PROFILE,
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.logout();
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.logout,
                                              size: 30,
                                            ),
                                            Text(
                                              HomeString.LOGOUT,
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
                ),
        );
      },
    );
  }
}
