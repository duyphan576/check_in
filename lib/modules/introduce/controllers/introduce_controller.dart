import 'package:check_in/core/index.dart';
import 'package:check_in/modules/introduce/repository/introduce_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroduceController extends GetxController with CacheManager {
  final IntroduceRepository introduceRepository;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  RxBool isLoading = true.obs;
  RxString errorMessage = "".obs;
  List<String?> validateGroup = [];

  final AuthenticationService authenticationService = AuthenticationService();

  IntroduceController({required this.introduceRepository});

  @override
  void onInit() async {
    super.onInit();
  }
}
