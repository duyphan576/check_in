import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/profile_detail_column.dart';
import 'package:check_in/global_widgets/profile_detail_row.dart';
import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/password_custom.dart';

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
                        color: AppColors.lightBlack,
                      ),
                    ),
                    body: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: GlobalStyles.paddingPageLeftRight_25,
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
                                    gradient: LinearGradient(
                                      colors: AppColors.listColorGradientMain,
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                    ),
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
                                                  title: 'Family Mid Name',
                                                  value: controller
                                                      .userData["famMidName"],
                                                ),
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              Expanded(
                                                child: ProfileDetailRow(
                                                  title: 'Name',
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
                                                  title: 'Gender',
                                                  value: controller
                                                      .userData["gender"],
                                                ),
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              Expanded(
                                                child: ProfileDetailRow(
                                                  title: 'Birthdate',
                                                  value: controller
                                                      .userData["birthdate"],
                                                ),
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight,
                                          Column(
                                            children: [
                                              ProfileDetailColumn(
                                                title: 'Email',
                                                value: controller
                                                    .userData["email"],
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              ProfileDetailColumn(
                                                title: 'Phone Number',
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
                    floatingActionButton: OutlinedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => onChangePassword(),
                        );
                      },
                      child: Text("Change Password"),
                    ),
                  )),
                ),
        );
      },
    );
  }
}

class onChangePassword extends GetView<ProfileController> {
  const onChangePassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PasswordEditText(
              hintText: ChangePasswordString.HINT_OLDPASSWORD,
              passwordController: controller.oldPasswordController),
          _PasswordEditText(
              hintText: ChangePasswordString.HINT_NEWPASSWORD,
              passwordController: controller.newPasswordController),
          _PasswordEditText(
              hintText: ChangePasswordString.HINT_CONFIRMPASSWORD,
              passwordController: controller.confirmPasswordController),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Xử lý khi nhấn nút Hủy
            Get.back();
          },
          child: Text('Hủy'),
        ),
        ElevatedButton(
          onPressed: () {
            controller.onChangePassword();
          },
          child: Text('Xác nhận'),
        ),
      ],
    );
  }
}

class _PasswordEditText extends GetView<ProfileController> {
  const _PasswordEditText({
    Key? key,
    required this.hintText,
    required this.passwordController,
  }) : super(key: key);
  final hintText;
  final passwordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PasswordCustom(
            hintText: hintText,
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
            inputAction: TextInputAction.done,
            onChangeFunction: (val) {
              controller.resetError();
            },
            prefixIcon: Icon(Icons.password),
          ),
        ),
      ],
    );
  }
}
