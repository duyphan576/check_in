import 'package:check_in/modules/notification/controllers/notification_controller.dart';
import 'package:check_in/modules/notification/provider/notification_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../repository/notification_repository.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => NotificationProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => NotificationRepository(
        notificationProvider: Get.find<NotificationProvider>()));

    Get.put(NotificationController(
      notificationRepository: Get.find<NotificationRepository>(),
    ));
  }
}
