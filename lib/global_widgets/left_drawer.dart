import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
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
            height: MediaQuery.of(context).size.height / 5,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.lightWhite.withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightWhite.withOpacity(0.5),
                  )
                ],
                gradient: LinearGradient(
                  colors: AppColors.listColorGradientMain,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            backgroundColor: Colors.transparent,
                            child: Text(
                              controller.userData["name"].substring(0, 1),
                              style: TextStyle(
                                color: AppColors.lightBlack,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GlobalStyles.sizedBoxHeight,
                    Text(
                      controller.userData["name"],
                      style: TextStyle(
                        color: AppColors.lightWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ]),
            ),
          ),
          _ListTileCustom(
            text: HomeString.CHECK_IN,
            function: () {
              Get.toNamed(Routes.CHECKIN);
            },
          ),
          _ListTileCustom(
            text: HomeString.CLASSROOM,
            function: () {
              Get.toNamed(Routes.CLASSROOM);
            },
          ),
          _ListTileCustom(
            text: HomeString.GRADE,
            function: () {
              Get.toNamed(Routes.GRADE);
            },
          ),
          _ListTileCustom(
            text: HomeString.PROFILE,
            function: () {
              Get.toNamed(Routes.PROFILE);
            },
          ),
          _ListTileCustom(
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
  });
  final String text;
  final function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onTap: function,
    );
  }
}
