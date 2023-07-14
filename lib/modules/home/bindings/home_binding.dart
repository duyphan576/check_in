import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/modules/home/provider/home_provider.dart';
import 'package:check_in/modules/home/repository/home_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => HomeRepository(homeProvider: Get.find<HomeProvider>()));
    Get.put(HomeController(
      homeRepository: Get.find<HomeRepository>(),
    ));
  }
}
