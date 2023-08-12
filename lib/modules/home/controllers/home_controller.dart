import 'package:check_in/constants/index.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/home/models/home_model.dart';
import 'package:check_in/modules/home/repository/home_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/services/global_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class HomeController extends GetxController with CacheManager {
  final HomeRepository homeRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;
  var params;
  RxInt countUnreadMessage = 0.obs;

  final globalService = Get.find<GlobalService>();

  HomeController({required this.homeRepository});

  @override
  void onInit() {
    // TODO: implement onInit

    globalService.notificationData.stream.listen((String? payload) {
      if (payload == null) return;
      initListMessage();
    });
    params = Get.arguments;
    initData();
    super.onInit();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    initListMessage();
    if (userData != null) {
      isLoading.value = false;
    }
  }

  logout() async {
    Alert.showLoadingIndicator(message: HomeString.LOGOUT);
    final response = await homeRepository.doGet(
      HomeModel(),
      UrlProvider.HANDLES_LOGOUT,
      cacheGet(
        CacheManagerKey.TOKEN,
      ),
    );
    if (response?.status == 1) {
      Alert.closeLoadingIndicator();
      Alert.showSuccess(
        title: CommonString.SUCCESS,
        buttonText: CommonString.OK,
        message: response?.message,
      ).then((value) {
        authenticationService.clearStorage();
        cacheRemove(CacheManagerKey.CUSTOMER_INFO);
        cacheRemove(CacheManagerKey.TOKEN);
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  initListMessage() async {
    isLoading.value = true;
    final response = await homeRepository.doGet(
      HomeModel(),
      UrlProvider.HANDLES_COUNT_NOTIFICATION,
      cacheGet(
        CacheManagerKey.TOKEN,
      ),
    );
    if (response?.statusCode == HttpStatus.ok) {
      isLoading.value = false;
      if (response?.status == 1) {
        countUnreadMessage.value = response?.data ?? 0;
      } else {
        countUnreadMessage.value = 0;
      }
    } else {
      isLoading.value = false;
      countUnreadMessage.value = 0;
    }
  }

  @override
  void onReady() {
    if (params != null && params['id'] != null && (params['type'] == "1")) {
      Get.toNamed(Routes.CHECKIN, arguments: params);
    } else if (params != null &&
        params['id'] != null &&
        params['type'] == "2") {
      Get.toNamed(Routes.GRADE, arguments: params);
    } else if (params != null &&
        params['id'] != null &&
        params['type'] == "3") {
      Get.toNamed(Routes.NOTIFICATION_DETAIL, arguments: params);
    }
    super.onReady();
  }
}
