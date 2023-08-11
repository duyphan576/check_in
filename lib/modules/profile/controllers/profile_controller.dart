import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/modules/profile/repository/profile_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController with CacheManager {
  final ProfileRepository profileRepository;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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

  active() async {
    resetError();
    Alert.showLoadingIndicator(message: AppString.SENDING_REQUEST);
    validateGroup = [
      Validator().validateRequireAllField(
        {
          'email': emailController.text,
          'phone': phoneController.text,
        },
        AppString.EMPTY,
      ),
      Validator().email(
        emailController.text,
        Message.VALID_EMAIL,
        Message.REQUIRE_EMAIL,
      ),
      Validator().tel(phoneController.text, {
        'EMPTY_TEL': Message.REQUIRE_PHONE,
        'VALID_TEL': Message.VALID_PHONE,
      }),
    ];
    this.errorMessage.value = Validator().validateForm(validateGroup)!;
    if (this.errorMessage.value == "") {
      String email = emailController.text;
      String phone = phoneController.text;
      final submit = {
        "email": email,
        "phone": phone,
      };
      final response = await profileRepository.profile(
        submit,
        UrlProvider.HANDLES_ACTIVE,
        cacheGet(CacheManagerKey.TOKEN),
      );
      print(response?.statusCode);
      if (response?.statusCode == HttpStatus.ok) {
        if (response?.status == 1) {
          Alert.closeLoadingIndicator();
          cacheSave(CacheManagerKey.CUSTOMER_INFO, response?.data["student"]);
          Alert.showError(
            title: CommonString.SUCCESS,
            message: response!.message.toString(),
            buttonText: CommonString.OK,
          ).then((value) => Get.offAllNamed(Routes.HOME));
        } else if (response?.status == 0) {
          isLoading.value = false;
          Alert.showError(
            title: CommonString.ERROR,
            message: response!.message.toString(),
            buttonText: CommonString.CANCEL,
          ).then((value) => Alert.closeLoadingIndicator());
        }
      } else {
        Alert.showError(
          title: CommonString.ERROR,
          message: this.errorMessage.value,
          buttonText: CommonString.CANCEL,
        ).then((value) => Alert.closeLoadingIndicator());
      }
    } else {
      Alert.showError(
        title: CommonString.ERROR,
        message: AppString.ERROR_MESSAGE,
        buttonText: CommonString.CANCEL,
      ).then((value) => Alert.closeLoadingIndicator());
    }
  }

  getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  resetError() {
    if (errorMessage.isNotEmpty) {
      errorMessage.value = "";
    }
  }
}
