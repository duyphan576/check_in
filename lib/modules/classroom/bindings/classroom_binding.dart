import 'package:check_in/modules/classroom/controllers/classroom_controller.dart';
import 'package:check_in/modules/classroom/provider/classroom_provider.dart';
import 'package:check_in/modules/classroom/repository/classroom_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ClassroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassroomProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() =>
        ClassroomRepository(classroomProvider: Get.find<ClassroomProvider>()));
    Get.put(ClassroomController(
      classroomRepository: Get.find<ClassroomRepository>(),
    ));
  }
}
