import 'package:check_in/core/index.dart';
import 'package:check_in/modules/profile/models/profile_model.dart';
import 'package:check_in/modules/profile/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:check_in/utils/validator.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../../constants/app_string.dart';
import '../../../services/domain_service.dart';

class ProfileController extends GetxController with CacheManager {
  final ProfileRepository profileRepository;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  var userData;
  RxBool isLoading = true.obs;
  RxString errorMessage = "".obs;
  List<String?> validateGroup = [];
  ProfileController({required this.profileRepository});

  @override
  void onInit() async {
    initData();
    super.onInit();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  onChangePassword() async {
    resetError();
    validateGroup = [
      Validator().validateRequireAllField(
        {
          'oldPassword': oldPasswordController.text,
          'newPassword': newPasswordController.text,
          'conirmPassword': confirmPasswordController.text
        },
        AppString.EMPTY,
      ),
    ];
    this.errorMessage.value = Validator().validateForm(validateGroup)!;
    if (this.errorMessage.value == "") {
      isLoading.value = true;
      String oldPassword = oldPasswordController.text;
      String newPassword = newPasswordController.text;
      String confirmPassword = confirmPasswordController.text;
      final response = await profileRepository.changePassord(
          ProfileModel(
              oldPassword: oldPassword,
              newPassword: newPassword,
              confirmPassword: confirmPassword),
          UrlProvider.HANDLES_PASSWORD,
          cacheGet(CacheManagerKey.TOKEN));
      print(response?.message);
      if (response?.statusCode == HttpStatus.ok) {
        Alert.closeLoadingIndicator();
        isLoading.value = false;

        if (response?.status == 1) {
          Alert.showSuccess(
              title: "Change password",
              buttonText: CommonString.CANCEL,
              message: "Đổi mật khẩu thành công");
        } else {
          isLoading.value = false;
          final snackBar = GetSnackBar(message: response?.message.toString());
          Get.showSnackbar(snackBar);
        }
      } else {
        Alert.closeLoadingIndicator();
        isLoading.value = false;
        Alert.showSuccess(
            title: CommonString.ERROR,
            message: response?.message.toString(),
            buttonText: CommonString.CANCEL);
      }
    }
  }

  resetError() {
    if (errorMessage.isNotEmpty) {
      errorMessage.value = "";
    }
  }
}
