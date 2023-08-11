import 'package:check_in/modules/notification_detail/controllers/notification_detail_controller.dart';
import 'package:check_in/modules/notification_detail/providers/notification_detail_provider.dart';
import 'package:check_in/modules/notification_detail/repository/notification_detail_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NotificationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        NotificationDetailProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => NotificationDetailRepository(
        notificationDetailProvider: Get.find<NotificationDetailProvider>()));
    Get.put(NotificationDetailController(
      notificationDetailRepository: Get.find<NotificationDetailRepository>(),
    ));
  }
}
