import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:check_in/constants/index.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Color(0xff262932) : Colors.white,
      body: GetBuilder<SplashController>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.icLogo,
                fit: BoxFit.cover,
                width: GetPlatform.isAndroid
                    ? MediaQuery.of(context).size.width / 3
                    : MediaQuery.of(context).size.width / 3.1,
              ),
            ),
            GlobalStyles.sizedBoxHeight_30,
            CircularProgressIndicator(
              color: AppColors.main,
            ),
          ],
        ),
      ),
    );
  }
}
