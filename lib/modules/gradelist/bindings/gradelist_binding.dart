import 'package:check_in/modules/gradelist/controllers/gradelist_controller.dart';
import 'package:check_in/modules/gradelist/provider/gradelist_provider.dart';
import 'package:check_in/modules/gradelist/repository/gradelist_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GradelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GradelistProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() =>
        GradelistRepository(gradelistProvider: Get.find<GradelistProvider>()));
    Get.put(GradelistController(
      gradelistRepository: Get.find<GradelistRepository>(),
    ));
  }
}
