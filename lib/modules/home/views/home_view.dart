import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/inkwell_custom.dart';
import 'package:check_in/global_widgets/left_drawer.dart';
import 'package:check_in/global_widgets/notification_widget.dart';
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
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                  ),
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      // extendBodyBehindAppBar: true,
                      resizeToAvoidBottomInset: true,
                      appBar: AppBar(
                        title: Text(
                          HomeString.HOME,
                          style: TextStyle(
                            color: AppColors.lightWhite,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(
                          color: AppColors.lightWhite,
                        ),
                        actions: [
                          Padding(
                            padding: GlobalStyles.paddingAll_8,
                            child: NotificationWidget(),
                          )
                        ],
                      ),

                      drawer: LeftDrawer(),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: GlobalStyles.paddingAll18,
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
                                    function: () {
                                      Get.toNamed(Routes.GRADE);
                                    },
                                    text: HomeString.GRADE,
                                    icon: Icons.grade,
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
