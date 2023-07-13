import 'dart:convert';

import 'package:check_in/core/index.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/global_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../repository/splash_repository.dart';

class SplashController extends GetxController with CacheManager {
  final SplashRepository splashRepository;
  final storage = GetStorage();
  final globalService = Get.find<GlobalService>();
  var result;
  bool isNotification = false;
  var arguments;
  var langCommon;
  var config;

  SplashController({required this.splashRepository});

  @override
  void onInit() async {
    super.onInit();
    arguments = Get.arguments;

    Future.delayed(Duration(seconds: 5), () {
      //no return when user is on login screen and press back, it will not return the
      //user to the splash screen
      intData();
    });
  }

  intData() async {
    globalService.navigateNotification.stream.listen((String? payload) {
      if (payload == null) return;
      result = json.decode(payload);
      isNotification = true;
    });

    if (isNotification) {
      Get.offAllNamed(Routes.HOME, arguments: result);
    } else {
      Get.offNamed(Routes.LOGIN);
    }

    // final response = await splashRepository
    //     .getConfig(SplashModel(act: DomainProvider.CONFIG, lang: 'vn'));
    //
    // if (response?.statusCode == HttpStatus.ok) {
    //   await cacheSave(CacheManagerKey.CONFIG, response?.data);
    //   if (isNotification) {
    //     Get.offAllNamed(Routes.HOME, arguments: result);
    //   } else {
    //     Get.offNamed(Routes.INIT);
    //   }
    // } else {
    //   Alert.showSuccess(
    //       title: FlutterI18n.translate(Get.context!, "COMMON.error"),
    //       message: FlutterI18n.translate(Get.context!, "COMMON.massageError"),
    //       buttonText: FlutterI18n.translate(Get.context!, "COMMON.ok"));
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
