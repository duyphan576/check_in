import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
import 'package:check_in/modules/changePassword/controllers/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(builder: (controller) {
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
                              child: Column(children: [
                                GlobalStyles.sizedBoxHeight,
                                Center(
                                  child: Image.asset(
                                    AppImages.icLogo,
                                    fit: BoxFit.cover,
                                    width: GetPlatform.isAndroid
                                        ? MediaQuery.of(context).size.width / 3
                                        : MediaQuery.of(context).size.width /
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
                                  hintText:
                                      ChangePasswordString.HINT_CONFIRMPASSWORD,
                                  passwordController:
                                      controller.confirmPasswordController,
                                ),
                                GlobalStyles.sizedBoxHeight,
                                GlobalStyles.sizedBoxHeight,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.lightWhite
                                            .withOpacity(0.75),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black,
                                            blurRadius: 2,
                                            blurStyle: BlurStyle.outer,
                                            offset:
                                                Offset(0, 0), // Shadow position
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          colors:
                                              AppColors.listColorGradientMain,
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          controller.onChangePassword();
                                        },
                                        child: Text(
                                          ChangePasswordString
                                              .HINT_CHANGEPASSWORD,
                                          style: TextStyle(
                                            color: AppColors.lightWhite,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size(200, 50)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GlobalStyles.sizedBoxHeight,
                              ]),
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
    });
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
