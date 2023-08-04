import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
import 'package:check_in/modules/change_password/controllers/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.lightWhite,
          ),
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  ChangePasswordString.HINT_CHANGEPASSWORD,
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
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Padding(
                        padding: GlobalStyles.paddingPageLeftRight_45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GlobalStyles.sizedBoxHeight_125,
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightWhite.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                      AppColors.subMain, // Color of the border
                                  width: 1.0, // Width of the border
                                ),
                              ),
                              child: Padding(
                                padding: GlobalStyles.paddingAll,
                                child: Column(
                                  children: [
                                    GlobalStyles.sizedBoxHeight,
                                    Center(
                                      child: Image.asset(
                                        AppImages.icLogo,
                                        fit: BoxFit.cover,
                                        width: GetPlatform.isAndroid
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.1,
                                      ),
                                    ),
                                    GlobalStyles.sizedBoxHeight_25,
                                    _PasswordEditText(
                                      hintText:
                                          ChangePasswordString.HINT_OLDPASSWORD,
                                      passwordController:
                                          controller.oldPasswordController,
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                    _PasswordEditText(
                                      hintText:
                                          ChangePasswordString.HINT_NEWPASSWORD,
                                      passwordController:
                                          controller.newPasswordController,
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                    _PasswordEditText(
                                      hintText: ChangePasswordString
                                          .HINT_CONFIRMPASSWORD,
                                      passwordController:
                                          controller.confirmPasswordController,
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                    GlobalStyles.sizedBoxHeight,
                                    InkWell(
                                      onTap: () {
                                        controller.onChangePassword();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppColors.main,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            ChangePasswordString
                                                .HINT_CHANGEPASSWORD,
                                            style: TextStyle(
                                              color: AppColors.lightWhite,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textScaleFactor: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordEditText extends GetView<ChangePasswordController> {
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
