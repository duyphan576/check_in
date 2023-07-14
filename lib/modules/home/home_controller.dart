import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with CacheManager {
  final AuthenticationService authenticationService = AuthenticationService();
  logout() async {
    authenticationService.clearStorage();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
