import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/modules/login/models/login_model.dart';
import 'package:check_in/modules/login/repository/login_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends GetxController with CacheManager {
  final LoginRepository loginRepository;
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthenticationService authenticationService = AuthenticationService();
  GetStorage data = GetStorage();
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  List<String?> validateGroup = [];
  var userData;
  RxBool isNewUser = true.obs;
  RxBool onTapIcon = true.obs;
  RxInt bioType = 0.obs;

  final LocalAuthentication auth = LocalAuthentication();

  LoginController({required this.loginRepository});

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      codeController.text = userData["code"];
    }

    getUserStatus();
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.strong)) {
      // Face ID.
      bioType.value = 1;
    }
    if (availableBiometrics.contains(BiometricType.fingerprint) ||
        availableBiometrics.contains(BiometricType.weak)) {
      // Touch ID.
      bioType.value = 2;
    }
  }

  Future<void> getUserStatus() async {
    final result = await authenticationService.read('pin');
    if (result.isNotEmpty && userData != null) {
      isNewUser.value = false;
    }
  }

  biometricLogin() async {
    try {
      final isAuthenticated = await auth.authenticate(
          localizedReason: LoginString.FINGER_DESCRIPTION,
          options: AuthenticationOptions(
            useErrorDialogs: true,
            biometricOnly: true,
            stickyAuth: true,
          ));
      if (isAuthenticated) {
        final result = await authenticationService.read('pin');
        if (result.isNotEmpty) {
          passwordController.text = result;
          onLogin();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      return;
    }
  }

  onLogin() async {
    resetError();
    validateGroup = [
      Validator().validateRequireAllField(
        {'code': codeController.text, 'password': passwordController.text},
        AppString.EMPTY,
      ),
    ];
    this.errorMessage.value = Validator().validateForm(validateGroup)!;

    if (this.errorMessage.value == "") {
      isLoading.value = true;
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
        isLoading.value = false;

        if (response?.status == 1) {
          cacheSave(CacheManagerKey.TOKEN, response?.data["access_token"]);
          cacheSave(CacheManagerKey.CUSTOMER_INFO, response?.data["user"]);
          authenticationService.write("pin", password);
          Get.offAndToNamed(Routes.HOME);
        } else {
          isLoading.value = false;
          final snackbar = GetSnackBar(message: response?.message.toString());
          Get.showSnackbar(snackbar);
        }
      } else {
        Alert.closeLoadingIndicator();
        isLoading.value = false;

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
