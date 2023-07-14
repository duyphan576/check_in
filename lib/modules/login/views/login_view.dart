import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/home/home_view.dart';
import 'package:check_in/modules/login/controllers/login_controller.dart';
import 'package:check_in/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
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
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () async {
                            controller.isLoading.value = true;
                            String url =
                                '${Api.baseUrl}${Api.studentApi.login}';
                            final response = await _connect.post(url, {
                              "code": "${controller.codeController.text}",
                              "password":
                                  "${controller.passwordController.text}"
                            });

                            if (response.body["success"] == 1) {
                              controller.data.write("token",
                                  "${response.body["data"]["access_token"]}");
                              var token = controller.data.read("token");

                              controller.data.write(
                                  "userData", response.body["data"]["user"]);
                              Students students = Students.fromJson(
                                  controller.data.read("userData"));
                              print(students.code);

                              if (students.code != null) {
                                Get.to(
                                    HomeView(students: students, token: token));
                              }
                            } else {
                              controller.isLoading.value = false;
                              final snackbar = SnackBar(
                                  content: Text(
                                      response.body["message"].toString()));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            }
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
