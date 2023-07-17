import 'package:check_in/constants/app_images.dart';
import 'package:check_in/constants/app_string.dart';
import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/modules/home/widgets/inkwell_custom.dart';
import 'package:check_in/modules/home/widgets/left_drawer.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/student_data.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.bg,
                      ),
                    ),
                  ),
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      // extendBodyBehindAppBar: true,
                      resizeToAvoidBottomInset: true,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(
                          color: AppColors.lightBlack,
                        ),
                      ),
                      drawer: LeftDrawer(),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.lightWhite.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.lightWhite
                                            .withOpacity(0.5),
                                      )
                                    ],
                                    // gradient: LinearGradient(
                                    //   colors: [
                                    //     Color(0xFF41D8D7),
                                    //     Color(0xFF21A3C6),
                                    //     Color(0xFF285DA2),
                                    //     Color(0xFF332F61),
                                    //     Color(0xFF452E51),
                                    //   ],
                                    //   begin: Alignment.bottomLeft,
                                    //   end: Alignment.topRight,
                                    // ),
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
                                          GlobalStyles.sizedBoxHeight,
                                          StudentCode(
                                            code: controller.userData!["code"]
                                                .toString(),
                                          ),
                                          GlobalStyles.sizedBoxHeight,
                                          StudentBirthdate(
                                            studentBirthdate: controller
                                                .userData["birthdate"],
                                          ),
                                        ],
                                      ),
                                      StudentPicture(
                                        picAddress:
                                            'assets/images/student_profile.jpeg',
                                      ),
                                    ],
                                  ),
                                ),
                                GlobalStyles.sizedBoxHeight_30,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWellCustom(
                                      function: () {},
                                      text: HomeString.CHECK_IN,
                                      icon: Icons.check,
                                    ),
                                    InkWellCustom(
                                      function: () {},
                                      text: HomeString.CLASSROOM,
                                      icon: Icons.class_,
                                    ),
                                  ],
                                ),
                                GlobalStyles.sizedBoxHeight_30,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWellCustom(
                                      function: () {},
                                      text: HomeString.GRADE,
                                      icon: Icons.grade,
                                    ),
                                    InkWellCustom(
                                      function: () {},
                                      text: HomeString.DOCUMENT,
                                      icon: Icons.storage,
                                    ),
                                  ],
                                ),
                                GlobalStyles.sizedBoxHeight_30,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWellCustom(
                                      function: () {
                                        Get.toNamed(Routes.PROFILE);
                                      },
                                      text: HomeString.PROFILE,
                                      icon: Icons.person,
                                    ),
                                    InkWellCustom(
                                      function: () {
                                        controller.logout();
                                      },
                                      text: HomeString.LOGOUT,
                                      icon: Icons.logout,
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
                ),
        );
      },
    );
  }
}
