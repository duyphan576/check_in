import 'package:check_in/modules/statistical/controllers/statistical_controller.dart';
import 'package:check_in/modules/statistical/provider/statistical_provider.dart';
import 'package:check_in/modules/statistical/repository/statistical_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class StatisticalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => StatisticalProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => StatisticalRepository(
        statisticalProvider: Get.find<StatisticalProvider>()));
    Get.put(StatisticalController(
      statisticalRepository: Get.find<StatisticalRepository>(),
    ));
  }
}
