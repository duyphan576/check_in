import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
import 'package:check_in/modules/checkin/provider/checkin_provider.dart';
import 'package:check_in/modules/checkin/repository/checkin_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CheckinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckinProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(
        () => CheckinRepository(checkinProvider: Get.find<CheckinProvider>()));
    Get.put(CheckinController(
      checkinRepository: Get.find<CheckinRepository>(),
    ));
  }
}
