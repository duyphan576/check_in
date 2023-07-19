import 'package:check_in/modules/classgrade/controllers/classgrade_controller.dart';
import 'package:check_in/modules/classgrade/provider/classgrade_provider.dart';
import 'package:check_in/modules/classgrade/repository/classgrade_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ClassgradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ClassgradeProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => ClassgradeRepository(
        classgradeProvider: Get.find<ClassgradeProvider>()));
    Get.put(ClassgradeController(
      classgradeRepository: Get.find<ClassgradeRepository>(),
    ));
  }
}
