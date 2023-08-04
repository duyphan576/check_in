import 'package:check_in/constants/index.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
import 'package:check_in/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController>
    with CacheManager {
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.lightWhite,
          ),
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  ForgotPasswordString.FORGOT_PASSWORD,
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
              ),
              backgroundColor: Colors.transparent,
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
                              // padding: GlobalStyles.paddingAll,
                              decoration: BoxDecoration(
                                color: AppColors.lightWhite.withOpacity(0.9),
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
                                    _CodeEditText(
                                      hintText: ForgotPasswordString.HINT_CODE,
                                      userNameController:
                                          controller.codeController,
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                    _EmailEditText(
                                      hintText: ForgotPasswordString.HINT_EMAIL,
                                      userNameController:
                                          controller.emailController,
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                    InkWell(
                                      onTap: () async {
                                        controller.onForgotPassword();
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
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.black,
                                              blurRadius: 4,
                                              blurStyle: BlurStyle.outer,
                                              offset: Offset(
                                                0,
                                                0,
                                              ), // Shadow position
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Obx(
                                            () => controller.isLoading.value
                                                ? CircularProgressIndicator(
                                                    color: AppColors.lightWhite,
                                                  )
                                                : Text(
                                                    ForgotPasswordString
                                                        .FORGOT_PASSWORD,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.lightWhite,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textScaleFactor: 1.0,
                                                  ),
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

class _CodeEditText extends GetView<ForgotPasswordController> {
  const _CodeEditText(
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

class _EmailEditText extends GetView<ForgotPasswordController> {
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
