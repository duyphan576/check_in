import 'package:check_in/modules/active_user/controllers/active_user_controller.dart';
import 'package:check_in/modules/active_user/provider/active_user_provider.dart';
import 'package:check_in/modules/active_user/repository/active_user_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ActiveUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ActiveUserProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => ActiveUserRepository(
        activeUserProvider: Get.find<ActiveUserProvider>()));
    Get.put(ActiveUserController(
      activeUserRepository: Get.find<ActiveUserRepository>(),
    ));
  }
}
