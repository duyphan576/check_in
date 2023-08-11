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

  NotificationDetailController({required this.notificationDetailRepository});

  @override
  void onInit() {
    super.onInit();
    //loadData();
  }

  void loadData() async {
    isLoading.value = true;
    final response = await notificationDetailRepository.loadData(
      NotificationDetailModel(),
      UrlProvider.HANDLES_SATISTICAL,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      final _request = response?.data;
      if (_request != null && _request.isNotEmpty) {
        notificationDetail.value = NotificationDetailModel.fromJson(_request);
      }
      update();
      isLoading.value = false;
    } else {
      Alert.closeLoadingIndicator();
      Alert.showError(
        title: AppString.ERROR,
        message: response!.message.toString(),
        buttonText: AppString.CANCEL,
      ).then((value) => Alert.closeLoadingIndicator());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
