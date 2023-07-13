import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/modules/login/models/login_model.dart';
import 'package:check_in/modules/login/repository/login_repository.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with CacheManager {
  final LoginRepository loginRepository;
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GetStorage data = GetStorage();
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  List<String?> validateGroup = [];

  LoginController({required this.loginRepository});
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onLoading() async {
    resetError();
    validateGroup = [
      Validator().validateRequireAllField(
        {'code': codeController.text, 'password': passwordController.text},
        AppString.EMPTY,
      ),
    ];
    this.errorMessage.value = Validator().validateForm(validateGroup)!;

    if (this.errorMessage.value == "") {
      Alert.showLoadingIndicator(message: LoginString.IS_LOGIN);
      String code = codeController.text;
      String password = passwordController.text;
      final response = await loginRepository.login(
          LoginModel(
            code: code,
            password: password,
          ),
          UrlProvider.HANDLES_LOGIN);

      if (response?.statusCode == HttpStatus.ok) {
        Alert.closeLoadingIndicator();
        // if (response?.status == 0) {
        //   Customer customer = Customer.fromJson(response!.data!);
        //   await cacheSave(CacheManagerKey.CUSTOMER_INFO, customer);
        //   authenticationService.write('pin', passwordController.text);
        //   Get.offAllNamed(Routes.HOME);
        //   //Get.snackbar("Success!", "Login Successful");
        // } else {
        //   errorMessage.value = response?.message ?? "";
        // }
      } else {
        Alert.closeLoadingIndicator();
        Alert.showSuccess(
            title: FlutterI18n.translate(Get.context!, "COMMON.error"),
            message: FlutterI18n.translate(Get.context!, "COMMON.massageError"),
            buttonText: FlutterI18n.translate(Get.context!, "COMMON.ok"));
      }
    }
  }

  resetError() {
    if (errorMessage.isNotEmpty) {
      errorMessage.value = "";
    }
  }
}
