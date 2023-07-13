import 'package:check_in/modules/splash/controllers/splash_controller.dart';
import 'package:check_in/modules/splash/provider/splash_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../repository/splash_repository.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(
        () => SplashRepository(splashProvider: Get.find<SplashProvider>()));

    Get.put(SplashController(
      splashRepository: Get.find<SplashRepository>(),
    ));
  }
}
