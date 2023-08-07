import 'package:check_in/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:check_in/modules/forgot_password/provider/forgot_password_provider.dart';
import 'package:check_in/modules/forgot_password/repository/forgot_password_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ForgotPasswordProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => ForgotPasswordRepository(
        forgotPasswordProvider: Get.find<ForgotPasswordProvider>()));
    Get.put(ForgotPasswordController(
      forgotPasswordRepository: Get.find<ForgotPasswordRepository>(),
    ));
  }
}
