import 'package:check_in/modules/login/controllers/login_controller.dart';
import 'package:check_in/modules/login/provider/login_provider.dart';
import 'package:check_in/modules/login/repository/login_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(
        () => LoginRepository(loginProvider: Get.find<LoginProvider>()));
    Get.put(LoginController(
      loginRepository: Get.find<LoginRepository>(),
    ));
  }
}
