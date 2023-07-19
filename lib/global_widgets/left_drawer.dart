import 'package:check_in/constants/app_string.dart';
import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 4,
                      width: MediaQuery.of(context).size.width / 4,
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        backgroundImage:
                            AssetImage('assets/images/student_profile.jpeg'),
                      ),
                    ),
                    GlobalStyles.sizedBoxHeight,
                    Text(
                      controller.userData["fullname"],
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
            function: () {},
          ),
          _ListTileCustom(
            text: HomeString.CLASSROOM,
            function: () {},
          ),
          _ListTileCustom(
            text: HomeString.GRADE,
            function: () {},
          ),
          _ListTileCustom(
            text: HomeString.DOCUMENT,
            function: () {},
          ),
          _ListTileCustom(
            text: HomeString.PROFILE,
            function: () {},
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
