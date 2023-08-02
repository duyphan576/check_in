import 'package:check_in/constants/index.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
import 'package:check_in/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> with CacheManager {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // opacity: 0.97,
            image: AssetImage(
              AppImages.bg,
            ),
          ),
        ),
        child: SafeArea(
          child: Scaffold(
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
                                _CodeEditText(
                                    hintText: LoginString.HINT_CODE,
                                    userNameController:
                                        controller.codeController),
                                GlobalStyles.sizedBoxHeight,
                                _PasswordEditText(
                                  hintText: LoginString.HINT_PASSWORD,
                                  passwordController:
                                      controller.passwordController,
                                ),
                                GlobalStyles.sizedBoxHeight,
                                Obx(
                                  () => Container(
                                    padding: GlobalStyles.paddingPageLeftRight,
                                    decoration: BoxDecoration(
                                        // color: AppColors.lightWhite,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: controller.isNewUser.value
                                        ? RememberPass()
                                        : _BiometricLogin(),
                                  ),
                                ),
                                GlobalStyles.sizedBoxHeight,
                                InkWell(
                                  onTap: () async {
                                    // await login(controller, _connect, context);
                                    controller.onLogin();
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.black,
                                          blurRadius: 4,
                                          blurStyle: BlurStyle.outer,
                                          offset:
                                              Offset(0, 0), // Shadow position
                                        ),
                                      ],
                                      gradient: LinearGradient(
                                        colors: AppColors.listColorGradientMain,
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: Obx(
                                        () => controller.isLoading.value
                                            ? CircularProgressIndicator(
                                                color: AppColors.lightWhite,
                                              )
                                            : Text(
                                                LoginString.LOGIN,
                                                style: TextStyle(
                                                  color: AppColors.lightWhite,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textScaleFactor: 1.0,
                                              ),
                                      ),
                                    ),
                                  ),
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

class _CodeEditText extends GetView<LoginController> {
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
            prefixIcon: Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}

class _PasswordEditText extends GetView<LoginController> {
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

class RememberPass extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onTapIcon.value = !controller.onTapIcon.value;
                    },
                    child: AnimatedCrossFade(
                      duration: Duration(milliseconds: 300),
                      firstChild: Icon(Icons.check_box_outline_blank),
                      secondChild: Icon(Icons.check_box),
                      crossFadeState: controller.onTapIcon.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  Text(
                    LoginString.REMEMBER_TEXT,
                    style: TextStyle(
                      color: AppColors.main,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.0,
                  ),
                ],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => controller.forgotPassword(),
                  child: Text(
                    LoginString.FORGOT_PASSWORD,
                    style: TextStyle(
                      color: AppColors.main,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class _BiometricLogin extends GetView<LoginController> {
  const _BiometricLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: Obx(
        () => controller.bioType.value == 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.biometricLogin(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.icFaceId,
                            width: 25,
                            height: 25,
                          ),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                LoginString.FACE_ID,
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => controller.forgotPassword(),
                        child: Text(
                          LoginString.FORGOT_PASSWORD,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.end,
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : controller.bioType.value == 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => controller.biometricLogin(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.fingerprint,
                                size: 25,
                              ),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    LoginString.FINGER_PRINT,
                                    style: TextStyle(
                                        color: AppColors.main,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    textScaleFactor: 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => controller.forgotPassword(),
                            child: Text(
                              LoginString.FORGOT_PASSWORD,
                              style: TextStyle(
                                color: AppColors.main,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : SizedBox(),
      ),
    );
  }
}
