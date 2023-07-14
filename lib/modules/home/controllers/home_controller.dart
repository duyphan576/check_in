import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/home/repository/home_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with CacheManager {
  final HomeRepository homeRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  HomeController({required this.homeRepository});
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  logout() async {
    authenticationService.clearStorage();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
