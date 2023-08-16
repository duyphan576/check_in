import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/introduce/controllers/introduce_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroduceView extends GetView<IntroduceController> {
  IntroduceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroduceController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.lightWhite,
          ),
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  IntroduceString.ABOUT_US,
                  style: TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    // color: AppColors.lightWhite,
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.bg,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: AppColors.lightWhite,
                ),
              ),
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Padding(
                  padding: GlobalStyles.paddingAll18,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        IntroduceString.INTRODUCE,
                        style: TextStyle(
                          fontSize: 24,
                        ),
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
