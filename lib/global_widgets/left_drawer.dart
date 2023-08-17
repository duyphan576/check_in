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
            height: MediaQuery.of(context).size.height / 4,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.lightWhite.withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightWhite.withOpacity(0.5),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 6,
                        width: MediaQuery.of(context).size.width / 6,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.lightWhite,
                              border: Border.all(
                                color: AppColors.subMain, // Color of the border
                                width: 2.0, // Width of the border
                              ),
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
                              color: AppColors.subMain,
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
                      color: AppColors.subMain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _ListTileCustom(
            icon: Icons.grade,
            text: HomeString.ABOUT_US,
            function: () {
              Get.toNamed(Routes.INTRODUCE);
            },
          ),
          _ListTileCustom(
            icon: Icons.info,
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
          fontSize: 16,
        ),
      ),
      onTap: function,
    );
  }
}
