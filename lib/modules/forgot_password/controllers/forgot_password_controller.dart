import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/modules/forgot_password/models/forgot_password_model.dart';
import 'package:check_in/modules/forgot_password/repository/forgot_password_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';

class ForgotPasswordController extends GetxController with CacheManager {
  final ForgotPasswordRepository forgotPasswordRepository;
  final TextEditingController codeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final AuthenticationService authenticationService = AuthenticationService();
  GetStorage data = GetStorage();
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;
  RxBool isOk = false.obs;
  List<String?> validateGroup = [];
  var userData;
  RxBool isNewUser = true.obs;
  RxBool onTapIcon = true.obs;
  RxInt bioType = 0.obs;

  final LocalAuthentication auth = LocalAuthentication();

  ForgotPasswordController({required this.forgotPasswordRepository});

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

  biometricForgotPassword() async {
    try {
      final isAuthenticated = await auth.authenticate(
          localizedReason: ForgotPasswordString.FINGER_DESCRIPTION,
          options: AuthenticationOptions(
            useErrorDialogs: true,
            biometricOnly: true,
            stickyAuth: true,
          ));
      if (isAuthenticated) {
        final result = await authenticationService.read('pin');
        if (result.isNotEmpty) {
          emailController.text = result;
          onForgotPassword();
        }
      }
    } on PlatformException {
      return;
    }
  }

  onForgotPassword() async {
    resetError();
    Alert.showLoadingIndicator(message: AppString.SENDING_REQUEST);
    validateGroup = [
      Validator().validateRequireAllField(
        {
          'code': codeController.text,
          'email': emailController.text,
        },
        AppString.EMPTY,
      ),
      Validator().email(
        emailController.text,
        AppString.VALID_EMAIL,
        Message.REQUIRE_EMAIL,
      ),
    ];
    this.errorMessage.value = Validator().validateForm(validateGroup)!;

    if (this.errorMessage.value == "") {
      String code = codeController.text;
      String email = emailController.text;
      final response = await forgotPasswordRepository.forgotPassword(
        ForgotPasswordModel(
          code: code,
          email: email,
        ),
        UrlProvider.HANDLES_FORGOT_PASSWORD,
      );
      if (response?.statusCode == HttpStatus.ok) {
        if (response?.status == 1) {
          Alert.showSuccess(
            title: CommonString.SUCCESS,
            message: response!.message.toString(),
            buttonText: CommonString.OK,
          ).then((value) => Get.offAllNamed(Routes.LOGIN));
        } else if (response?.status == 0) {
          isLoading.value = false;
          Alert.showError(
            title: CommonString.ERROR,
            message: response!.message.toString(),
            buttonText: CommonString.CANCEL,
          ).then((value) => Alert.closeLoadingIndicator());
        }
      }
    } else {
      Alert.showError(
        title: CommonString.ERROR,
        message: this.errorMessage.value,
        buttonText: CommonString.CANCEL,
      ).then((value) => Alert.closeLoadingIndicator());
    }
  }

  resetError() {
    if (errorMessage.isNotEmpty) {
      errorMessage.value = "";
    }
  }
}
