import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/routes/app_pages.dart';
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
                color: AppColors.lightWhite.withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightWhite.withOpacity(0.5),
                  )
                ],
                // gradient: LinearGradient(
                //   colors: AppColors.listColorGradientMain,
                //   begin: Alignment.bottomLeft,
                //   end: Alignment.topRight,
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.lightWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightWhite,
                                  blurRadius: 4,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0, 0), // Shadow position
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundColor: AppColors.subMain,
                              child: Text(
                                controller.userData["name"].substring(0, 1),
                                style: TextStyle(
                                  color: AppColors.lightWhite,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GlobalStyles.sizedBoxWidth,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userData["name"],
                            style: TextStyle(
                              color: AppColors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Divider(
                              thickness: 1.0,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            controller.userData["code"],
                            style: TextStyle(
                              color: AppColors.black,
                              // fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GlobalStyles.sizedBoxHeight,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Divider(
                      thickness: 1.0,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _ListTileCustom(
            text: HomeString.CHECK_IN,
            function: () {
              Get.toNamed(Routes.CHECKIN);
            },
            icon: Icons.check,
          ),
          _ListTileCustom(
            icon: Icons.class_,
            text: HomeString.CLASSROOM,
            function: () {
              Get.toNamed(Routes.CLASSROOM);
            },
          ),
          _ListTileCustom(
            icon: Icons.grade,
            text: HomeString.GRADE,
            function: () {
              Get.toNamed(Routes.GRADE);
            },
          ),
          _ListTileCustom(
            icon: Icons.person,
            text: HomeString.PROFILE,
            function: () {
              Get.toNamed(Routes.PROFILE);
            },
          ),
          _ListTileCustom(
            icon: Icons.logout,
            text: HomeString.LOGOUT,
            function: () {
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}

class _ListTileCustom extends StatelessWidget {
  const _ListTileCustom({
    required this.text,
    this.function,
    required this.icon,
  });
  final String text;
  final function;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.subMain,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: AppColors.black,
          // fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onTap: function,
    );
  }
}
