import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:check_in/modules/grade/provider/grade_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../repository/grade_repository.dart';

class GradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GradeProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(
        () => GradeRepository(gradeProvider: Get.find<GradeProvider>()));

    Get.put(GradeController(
      gradeRepository: Get.find<GradeRepository>(),
    ));
  }
}
