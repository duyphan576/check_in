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
}
