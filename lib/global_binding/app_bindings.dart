import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/providers/app_providers.dart';
import '../data/repository/app_repository.dart';
import '../global_controller/app_controller.dart';
import '../services/http_provider.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HttpProvider(httpClient: Dio()));
    Get.lazyPut(() => AppProvider(Get.find<HttpProvider>()));
    Get.lazyPut(() => AppRepository(Get.find<AppProvider>()));
    Get.lazyPut(() => AppController(Get.find<AppRepository>()));
  }
}
