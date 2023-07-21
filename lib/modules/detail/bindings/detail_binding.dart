import 'package:check_in/modules/detail/controllers/detail_controller.dart';
import 'package:check_in/modules/detail/provider/detail_provider.dart';
import 'package:check_in/modules/detail/repository/detail_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(
        () => DetailRepository(detailProvider: Get.find<DetailProvider>()));
    Get.put(DetailController(
      detailRepository: Get.find<DetailRepository>(),
    ));
  }
}
