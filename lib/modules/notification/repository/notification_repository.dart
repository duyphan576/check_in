import 'package:check_in/core/index.dart';
import 'package:check_in/modules/notification/provider/notification_provider.dart';

class NotificationRepository {
  NotificationRepository({required this.notificationProvider});

  final NotificationProvider notificationProvider;
  Future<BaseResponse?> notification(url, token) =>
      notificationProvider.notification(url, token);
}
