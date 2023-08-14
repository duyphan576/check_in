import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
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
                                    code:
                                        controller.userData!["code"].toString(),
                                    height: height,
                                    width: width,
                                  ),
                                  GlobalStyles.sizedBoxHeight,
                                  Container(
                                    padding: GlobalStyles.paddingAll,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightWhite
                                          .withOpacity(0.75),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors
                                            .subMain, // Color of the border
                                        width: 1.0, // Width of the border
                                      ),
                                    ),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: constraints.maxHeight * 0.4,
                                      ),
                                      child: Padding(
                                        padding: GlobalStyles.paddingAll,
                                        child: controller.userData["email"] !=
                                                    null &&
                                                controller.userData["phone"] !=
                                                    null
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GlobalStyles.sizedBoxHeight,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: ProfileDetailRow(
                                                          title: ProfileString
                                                              .FMNAME,
                                                          value: controller
                                                                  .userData[
                                                              "famMidName"],
                                                        ),
                                                      ),
                                                      GlobalStyles
                                                          .sizedBoxHeight,
                                                      Expanded(
                                                        child: ProfileDetailRow(
                                                          title: ProfileString
                                                              .NAME,
                                                          value: controller
                                                              .userData["name"],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  GlobalStyles.sizedBoxHeight,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: ProfileDetailRow(
                                                          title: ProfileString
                                                              .GENDER,
                                                          value: controller
                                                                  .userData[
                                                              "gender"],
                                                        ),
                                                      ),
                                                      GlobalStyles
                                                          .sizedBoxHeight,
                                                      Expanded(
                                                        child: ProfileDetailRow(
                                                          title: ProfileString
                                                              .BIRTHDATE,
                                                          value: controller
                                                              .getFormatedDate(
                                                            controller.userData[
                                                                "birthdate"],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  GlobalStyles.sizedBoxHeight,
                                                  Column(
                                                    children: [
                                                      ProfileDetailColumn(
                                                        title:
                                                            ProfileString.EMAIL,
                                                        value: controller
                                                            .userData["email"],
                                                      ),
                                                      GlobalStyles
                                                          .sizedBoxHeight,
                                                      ProfileDetailColumn(
                                                        title: ProfileString
                                                            .PHONE_NUMBER,
                                                        value: controller
                                                            .userData["phone"],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                "* ${ProfileString.NOTE}: ",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: ProfileString
                                                                .MESSAGE,
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  GlobalStyles.sizedBoxHeight,
                                                  _EmailEditText(
                                                      hintText: "Email",
                                                      userNameController:
                                                          controller
                                                              .emailController),
                                                  GlobalStyles.sizedBoxHeight,
                                                  _PhoneEditText(
                                                      hintText: "Phone",
                                                      userNameController:
                                                          controller
                                                              .phoneController),
                                                  GlobalStyles
                                                      .sizedBoxHeight_25,
                                                  InkWell(
                                                    onTap: () async {
                                                      controller.showConfirm();
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              100,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.main,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                          color: AppColors
                                                              .subMain, // Color of the border
                                                          width:
                                                              1.0, // Width of the border
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Obx(
                                                          () => controller
                                                                  .isLoading
                                                                  .value
                                                              ? CircularProgressIndicator(
                                                                  color: AppColors
                                                                      .lightWhite,
                                                                )
                                                              : Text(
                                                                  ProfileString
                                                                      .ACTIVE,
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .lightWhite,
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  textScaleFactor:
                                                                      1.0,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
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
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class _PhoneEditText extends GetView<ProfileController> {
  const _PhoneEditText(
      {Key? key, required this.hintText, required this.userNameController})
      : super(key: key);
  final hintText;
  final userNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldLogin(
            hintText: hintText,
            controller: userNameController,
            inputAction: TextInputAction.next,
            onChangeFunction: (val) {
              controller.resetError();
            },
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmailEditText extends GetView<ProfileController> {
  const _EmailEditText(
      {Key? key, required this.hintText, required this.userNameController})
      : super(key: key);
  final hintText;
  final userNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldLogin(
            hintText: hintText,
            controller: userNameController,
            inputAction: TextInputAction.next,
            onChangeFunction: (val) {
              controller.resetError();
            },
            prefixIcon: Icon(
              Icons.email,
            ),
          ),
        ),
      ],
    );
  }
}
