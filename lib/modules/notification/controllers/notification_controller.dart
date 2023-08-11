import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/models/notification/notification.dart';
import 'package:check_in/modules/notification/repository/notification_repository.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/services/global_service.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController with CacheManager {
  final NotificationRepository notificationRepository;
  final globalService = Get.find<GlobalService>();
  var result;
  RxBool isNotification = false.obs;
  RxBool isLoading = true.obs;
  RxList<NotificationModel> notificationList = RxList<NotificationModel>();

  var arguments;

  NotificationController({required this.notificationRepository});

  @override
  void onInit() async {
    super.onInit();
    initData();
  }

  void initData() async {
    final response = await notificationRepository.notification(
      UrlProvider.HANDLES_NOTIFICATION,
      cacheGet(CacheManagerKey.TOKEN),
    );
    print(response?.status);
    if (response!.status == 1) {
      for (final list in response.data) {
        NotificationModel notification = NotificationModel.fromJson(list);
        notificationList.add(notification);
      }
      isLoading.value = false;
    } else {
      Alert.showError(
        title: AppString.ERROR,
        message: response.message.toString(),
        buttonText: AppString.CANCEL,
      ).then((value) => Get.back());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getFormatDateDuration(dateString) {
    if (dateString != "null") {
      DateTime date = DateTime.parse(dateString).toLocal().toLocal();

      // Thời điểm hiện tại
      DateTime currentDateTime = DateTime.now().toLocal();

      // Tính khoảng thời gian
      Duration difference = currentDateTime.difference(date);

      // Format khoảng thời gian sử dụng intl
      String formattedDifference = formatDuration(difference);
      return formattedDifference;
    }

    return "";
  }

  String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return "${duration.inDays} ngày trước";
    } else if (duration.inHours > 0) {
      return "${duration.inHours} giờ trước";
    } else {
      return "${duration.inMinutes} phút trước";
    }
  }

  var json = {
    "success": 1,
    "message": "Get notification in list successfully",
    "data": [
      {
        "id": "1",
        "type": "3",
        "idNotification": "1",
        "title": "Test",
        "body": "Test Notification",
        "time": "2023-08-02T02:14:39.000000Z",
        "status": "0"
      },
      {
        "id": "2",
        "type": "1",
        "idNotification": "",
        "title": "Test",
        "body": "Test Notification",
        "time": "2023-08-02T02:14:39.000000Z",
        "status": "0"
      },
      {
        "id": "3",
        "type": "1",
        "idNotification": "3",
        "title": "Test",
        "body": "Test Notification",
        "time": "2023-08-02T02:14:39.000000Z",
        "status": "1"
      },
      {
        "id": "4",
        "type": "3",
        "idNotification": "4",
        "title": "Test",
        "body": "Test Notification",
        "time": "2023-08-02T02:14:39.000000Z",
        "status": "1"
      },
      {
        "id": "5",
        "type": "2",
        "idNotification": "5",
        "title": "Test",
        "body": "Test Notification",
        "time": "2023-08-02T02:14:39.000000Z",
        "status": "1"
      },
      {
        "id": "6",
        "type": "3",
        "idNotification": "6",
        "title": "Test",
        "body": "Test Notification",
        "time": "2023-08-02T02:14:39.000000Z",
        "status": "1"
      }
    ]
  };
}
