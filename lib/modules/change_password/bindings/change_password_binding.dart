import 'package:check_in/modules/change_password/controllers/change_password_controller.dart';
import 'package:check_in/modules/change_password/provider/change_password_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../repository/change_password_repository.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ChangePasswordProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => ChangePasswordRepository(
        changePasswordProvider: Get.find<ChangePasswordProvider>()));

    Get.put(ChangePasswordController(
      changePasswordRepository: Get.find<ChangePasswordRepository>(),
    ));
  }
}
