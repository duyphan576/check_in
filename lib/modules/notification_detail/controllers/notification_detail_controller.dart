import 'package:check_in/constants/index.dart';
import 'package:check_in/modules/notification_detail/models/notification_detail_model.dart';
import 'package:check_in/modules/notification_detail/repository/notification_detail_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';

import 'package:check_in/core/index.dart';
import 'package:get/get.dart';

class NotificationDetailController extends GetxController with CacheManager {
  final NotificationDetailRepository notificationDetailRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  RxBool isLoading = false.obs;
  Rx<NotificationDetailModel> notificationDetail =
      NotificationDetailModel().obs;
  var param;
  RxString content = "".obs;

  NotificationDetailController({required this.notificationDetailRepository});

  @override
  void onInit() {
    super.onInit();
    setSeen();
  }

  Future<void> setSeen() async {
    isLoading.value = true;
    param = Get.arguments;
    if (param != null) {
      final response = await notificationDetailRepository.seen(
        {
          "id": param.toString(),
        },
        UrlProvider.HANDLES_SEEN_NOTIFICATION,
        cacheGet(CacheManagerKey.TOKEN),
      );
      if (response!.status == 1) {
        content.value = response.data;
        isLoading.value = false;
        update();
      } else {
        Alert.showError(
          title: AppString.ERROR,
          message: response.message.toString(),
          buttonText: AppString.CANCEL,
        ).then((value) => Get.back());
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
