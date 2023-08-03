import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/profile_detail_column.dart';
import 'package:check_in/global_widgets/profile_detail_row.dart';
import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/modules/profile/controllers/profile_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
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
                        ProfileString.PROFILE,
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
                      actions: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: TextButton(
                              onPressed: () =>
                                  Get.toNamed(Routes.CHANGE_PASSWORD),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.icChangePassword,
                                    fit: BoxFit.cover,
                                    color: AppColors.lightWhite,
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                    body: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: GlobalStyles.paddingAll18,
                            child: Column(
                              children: [
                                StudentPicture(
                                  name: controller.userData["name"],
                                  code: controller.userData!["code"].toString(),
                                  height: height,
                                  width: width,
                                ),
                                GlobalStyles.sizedBoxHeight,
                                Container(
                                  padding: GlobalStyles.paddingAll,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.lightWhite.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black,
                                        blurRadius: 4,
                                        blurStyle: BlurStyle.outer,
                                        offset: Offset(0, 0), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minHeight: constraints.maxHeight * 0.4),
                                    child: Padding(
                                      padding: GlobalStyles.paddingAll,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GlobalStyles.sizedBoxHeight,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: ProfileDetailRow(
                                                  title: ProfileString.FMNAME,
                                                  value: controller
                                                      .userData["famMidName"],
                                                ),
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              Expanded(
                                                child: ProfileDetailRow(
                                                  title: ProfileString.NAME,
                                                  value: controller
                                                      .userData["name"],
                                                ),
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: ProfileDetailRow(
                                                  title: ProfileString.GENDER,
                                                  value: controller
                                                      .userData["gender"],
                                                ),
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              Expanded(
                                                child: ProfileDetailRow(
                                                  title:
                                                      ProfileString.BIRTHDATE,
                                                  value: controller
                                                      .getFormatedDate(
                                                    controller
                                                        .userData["birthdate"],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight,
                                          Column(
                                            children: [
                                              ProfileDetailColumn(
                                                title: ProfileString.EMAIL,
                                                value: controller
                                                    .userData["email"],
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              ProfileDetailColumn(
                                                title:
                                                    ProfileString.PHONE_NUMBER,
                                                value: controller
                                                    .userData["phone"],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
                ),
        );
      },
    );
  }
}
