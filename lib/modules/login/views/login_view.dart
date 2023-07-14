import 'package:check_in/constants/index.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/home/home_view.dart';
import 'package:check_in/modules/login/controllers/login_controller.dart';
import 'package:check_in/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> with CacheManager {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _connect = GetConnect();
    return GetBuilder<LoginController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: GlobalStyles.paddingPageLeftRight_45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalStyles.sizedBoxHeight_75,
                        Center(
                          child: Image.asset(
                            AppImages.icLogo,
                            fit: BoxFit.cover,
                            width: GetPlatform.isAndroid
                                ? MediaQuery.of(context).size.width / 2
                                : MediaQuery.of(context).size.width / 2.1,
                          ),
                        ),
                        GlobalStyles.sizedBoxHeight_30,
                        _CodeEditText(
                            hintText: LoginString.HINT_CODE,
                            userNameController: controller.codeController),
                        GlobalStyles.sizedBoxHeight,
                        _PasswordEditText(
                          hintText: LoginString.HINT_PASSWORD,
                          passwordController: controller.passwordController,
                        ),
                        GlobalStyles.sizedBoxHeight,
                        Obx(
                          () => controller.isNewUser.value
                              ? RememberPass()
                              : _BiometricLogin(),
                        ),
                        InkWell(
                          onTap: () async {
                            // await login(controller, _connect, context);
                            controller.onLogin();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: Center(
                              child: Obx(
                                () => controller.isLoading.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: AnimatedCrossFade(
                        duration: Duration(milliseconds: 300),
                        firstChild: Icon(Icons.check_box),
                        secondChild: Icon(Icons.check_circle),
                        crossFadeState: controller.onTapIcon.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ),
                  ),
                  Text(
                    LoginString.REMEMBER_TEXT,
                    style: TextStyle(
                        color: AppColors.main,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textScaleFactor: 1.0,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  // onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD_EMAIL),
                  child: Text(
                    LoginString.FORGOT_PASSWOER,
                    style: TextStyle(
                      color: AppColors.main,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
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
                                    color: AppColors.main,
                                    fontSize: 16,
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
                        // onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD_EMAIL),
                        child: Text(
                          LoginString.FORGOT_PASSWOER,
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.end,
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.biometricLogin(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.icFingerPrint,
                            width: 25,
                            height: 25,
                          ),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                LoginString.FINGER_PRINT,
                                style: TextStyle(
                                    color: AppColors.main,
                                    fontSize: 16,
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
                        // onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD_EMAIL),
                        child: Text(
                          LoginString.FORGOT_PASSWOER,
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
