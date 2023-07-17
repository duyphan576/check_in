import 'dart:convert';

import 'package:check_in/core/index.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:get/get.dart';

import '../repository/profile_repository.dart';

class ProfileController extends GetxController with CacheManager {
  final ProfileRepository profileRepository;
  var userData;
  RxBool isLoading = true.obs;

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
