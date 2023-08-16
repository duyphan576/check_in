import 'package:check_in/modules/introduce/controllers/introduce_controller.dart';
import 'package:check_in/modules/introduce/provider/introduce_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../repository/introduce_repository.dart';

class IntroduceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroduceProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() =>
        IntroduceRepository(introduceProvider: Get.find<IntroduceProvider>()));

    Get.put(IntroduceController(
      introduceRepository: Get.find<IntroduceRepository>(),
    ));
  }
}
