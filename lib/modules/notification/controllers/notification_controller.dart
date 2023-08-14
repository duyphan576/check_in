import 'package:check_in/constants/index.dart';
import 'package:check_in/core/index.dart';
import 'package:check_in/models/notification/notification.dart';
import 'package:check_in/modules/notification/repository/notification_repository.dart';
import 'package:check_in/routes/app_pages.dart';
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

  NotificationController({required this.notificationRepository});

  @override
  void onInit() async {
    initData();
    globalService.notificationData.stream.listen((String? payload) {
      if (payload == null) return;
      notificationList.value = [];
      initData();
    });

    super.onInit();
  }

  void initData() async {
    isLoading.value = true;
    final response = await notificationRepository.notification(
      UrlProvider.HANDLES_NOTIFICATION,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response!.status == 1) {
      notificationList.clear();
      for (final list in response.data) {
        NotificationModel notification = NotificationModel.fromJson(list);
        notificationList.add(notification);
      }
      isLoading.value = false;
      update();
    } else {
      notificationList.value = [];
      Alert.showError(
        title: AppString.ERROR,
        message: response.message.toString(),
        buttonText: AppString.CANCEL,
      ).then((value) => Get.back());
    }
  }

  showConfirm() {
    Alert.showConfirmDialog(detail: "Bạn có muốn đánh dấu đã đọc tất cả không?")
        .then((value) {
      if (value == true) {
        seenAllNotification();
        update();
      }
    });
  }

  seenAllNotification() async {
    isLoading.value = true;
    final response = await notificationRepository.doGet(
      UrlProvider.HANDLES_SEEN_ALL_NOTIFICATION,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response!.status == 1) {
      isLoading.value = false;
      initData();
    } else {
      isLoading.value = false;

      Alert.showError(
        title: AppString.ERROR,
        message: response.message.toString(),
        buttonText: AppString.CANCEL,
      ).then((value) => Get.back());
    }
  }

  @override
  void onReady() async {
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

  routesPage(NotificationModel notify) {
    final type = notify.type;
    switch (type) {
      case "1":
        Get.toNamed(
          Routes.CHECKIN,
          arguments: notify.id,
        )!
            .then(
          (value) => initData(),
        );
        break;
      case "2":
        Get.toNamed(
          Routes.GRADE,
          arguments: notify.id,
        )!
            .then(
          (value) => initData(),
        );
        break;
      case "3":
        Get.toNamed(
          Routes.NOTIFICATION_DETAIL,
          arguments: notify.id,
        )!
            .then(
          (value) => initData(),
        );
    }
  }
}
