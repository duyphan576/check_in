import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/inkwell_custom.dart';
import 'package:check_in/global_widgets/left_drawer.dart';
import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                          color: AppColors.main,
                        ),
                      ),
                      drawer: LeftDrawer(),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: GlobalStyles.paddingPageLeftRight_25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              StudentPicture(
                                name: controller.userData["fullname"],
                                code: controller.userData!["code"].toString(),
                                height: height,
                                width: width,
                                onTap: () => Get.toNamed(Routes.PROFILE),
                              ),
                              GlobalStyles.sizedBoxHeight,
                              Column(
                                children: [
                                  InkWellCustom(
                                    function: () {
                                      Get.toNamed(Routes.CHECKIN);
                                    },
                                    text: HomeString.CHECK_IN,
                                    icon: Icons.check,
                                    height: height,
                                    width: width,
                                  ),
                                  GlobalStyles.sizedBoxHeight,
                                  InkWellCustom(
                                    function: () {
                                      Get.toNamed(Routes.CLASSROOM);
                                    },
                                    text: HomeString.CLASSROOM,
                                    icon: Icons.class_,
                                    height: height,
                                    width: width,
                                  ),
                                  GlobalStyles.sizedBoxHeight,
                                  InkWellCustom(
                                    function: () {},
                                    text: HomeString.GRADE,
                                    icon: Icons.grade,
                                    height: height,
                                    width: width,
                                  ),
                                  GlobalStyles.sizedBoxHeight,
                                  InkWellCustom(
                                    function: () {
                                      Get.toNamed(Routes.PROFILE);
                                    },
                                    text: HomeString.PROFILE,
                                    icon: Icons.person,
                                    height: height,
                                    width: width,
                                  ),
                                ],
                              ),
                            ],
                          ),
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
