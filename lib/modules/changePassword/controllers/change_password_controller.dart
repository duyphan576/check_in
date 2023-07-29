import 'package:check_in/core/index.dart';
import 'package:check_in/modules/changePassword/models/change_password_model.dart';
import 'package:check_in/modules/changePassword/repository/change_password_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:check_in/utils/validator.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../../constants/app_string.dart';
import '../../../services/domain_service.dart';

class ChangePasswordController extends GetxController with CacheManager {
  final ChangePasswordRepository changePasswordRepository;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  var userData;
  var messeage = Message;
  RxBool isLoading = true.obs;
  RxBool isOk = false.obs;

  RxString errorMessage = "".obs;
  List<String?> validateGroup = [];

  final AuthenticationService authenticationService = AuthenticationService();

  ChangePasswordController({required this.changePasswordRepository});

  @override
  void onInit() async {
    super.onInit();
  }

  onChangePassword() async {
    resetError();
    validateGroup = [
      Validator().validateRequireAllField(
        {
          'oldPassword': oldPasswordController.text,
          'newPassword': newPasswordController.text,
          'confirmPassword': confirmPasswordController.text
        },
        AppString.EMPTY,
      ),
      Validator()
          .validPassword(newPasswordController.text, Message.VALID_PASSWORD),
      Validator().validPassword(
          confirmPasswordController.text, Message.VALID_PASSWORD),
      Validator().cPassword(
          confirmPasswordController.text, newPasswordController.text, {
        'VALID_C_PASSWORD': Message.VALID_C_PASSWORD,
        'EMPTY_PASSWORD': Message.EMPTY_PASSWORD,
        'EMPTY_CPASSWORD': Message.EMPTY_CPASSWORD,
      }),
    ];
    this.errorMessage.value = Validator().validateForm(validateGroup)!;
    print(this.errorMessage.value);
    if (this.errorMessage.value == "") {
      isLoading.value = true;
      String oldPassword = oldPasswordController.text;
      String newPassword = newPasswordController.text;
      String confirmPassword = confirmPasswordController.text;
      final response = await changePasswordRepository.changePassword(
          ChangePasswordModel(
              oldPassword: oldPassword,
              newPassword: newPassword,
              confirmPassword: confirmPassword),
          UrlProvider.HANDLES_PASSWORD,
          cacheGet(CacheManagerKey.TOKEN));
      if (response?.statusCode == HttpStatus.ok) {
        isLoading.value = false;
        print(response?.status);
        if (response?.status == 1) {
          Alert.closeLoadingIndicator();
          Alert.showSuccess(
            title: ChangePasswordString.HINT_CHANGEPASSWORD,
            buttonText: CommonString.OK,
            message: response?.message,
          ).then((value) => logout());
        } else {
          Alert.showSuccess(
            title: CommonString.ERROR,
            message: response?.message,
            buttonText: CommonString.CANCEL,
          );
        }
      }
    } else {
      Alert.showSuccess(
        title: CommonString.ERROR,
        message: this.errorMessage.value,
        buttonText: CommonString.CANCEL,
      );
    }
  }

  resetError() {
    if (errorMessage.isNotEmpty) {
      errorMessage.value = "";
    }
  }

  logout() async {
    final response = await changePasswordRepository.logout(
      ChangePasswordModel(),
      UrlProvider.HANDLES_LOGOUT,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      authenticationService.clearStorage();
      cacheRemove(CacheManagerKey.TOKEN);
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
