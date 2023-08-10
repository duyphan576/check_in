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

class HomeController extends GetxController with CacheManager {
  final HomeRepository homeRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;
  var params;
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

  initListMessage() async {
    isLoading.value = true;
    // final response = await homeRepository.getUnreadMessage(HomeModel(
    //     act: DomainProvider.NOTIFICATION,
    //     plus: PlusProvider.TOTAL_NOTIFICATION,
    //     userId: userId));
    // if (response?.statusCode == HttpStatus.ok) {
    //   isLoading.value = false;
    //   if (response?.status == 0) {
    //     homeModel = HomeModel.fromJson(response?.data);
    //     countUnreadMessage.value = homeModel?.total ?? 0;
    //   } else {
    //     countUnreadMessage.value = 0;
    //   }
    // } else {
    //   isLoading.value = false;
    //   countUnreadMessage.value = 0;
    // }
  }

  @override
  void onReady() {
    // if (params != null &&
    //     params['id'] != null &&
    //     (params['isApproval'] == "1" || params['isApproval'] == "2")) {
    //   Get.toNamed(Routes.REQUEST_DETAIL, arguments: params);
    // } else if (params != null &&
    //     params['id'] != null &&
    //     params['isApproval'] == "4") {
    //   Get.toNamed(Routes.RP_CONFIRMATION_DETAIL, arguments: params);
    // } else if (params != null &&
    //     params['id'] != null &&
    //     params['isApproval'] == "5") {
    //   Get.toNamed(Routes.PAY_VOTES_DETAIL, arguments: params);
    // } else if (params != null &&
    //     params['id'] != null &&
    //     params['isApproval'] == "6") {
    //   Get.toNamed(Routes.INTERNAL_MONEY_TRANSFER_DETAIL, arguments: params);
    // }
    super.onReady();
  }
}
