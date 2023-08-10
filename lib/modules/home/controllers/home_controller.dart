import 'package:check_in/constants/index.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/home/models/home_model.dart';
import 'package:check_in/modules/home/repository/home_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with CacheManager {
  final HomeRepository homeRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;

  HomeController({required this.homeRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
    setupInteractedMessage();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  logout() async {
    Alert.showLoadingIndicator(message: HomeString.LOGOUT);
    final response = await homeRepository.home(
      HomeModel(),
      UrlProvider.HANDLES_LOGOUT,
      cacheGet(CacheManagerKey.TOKEN),
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

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      print(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
  }
}
