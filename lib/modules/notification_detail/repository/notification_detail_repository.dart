import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/notification_detail/providers/notification_detail_provider.dart';

class NotificationDetailRepository {
  NotificationDetailRepository({required this.notificationDetailProvider});

  final NotificationDetailProvider notificationDetailProvider;

  Future<BaseResponse?> seen(Map<String, dynamic> id, url, token) =>
      notificationDetailProvider.seen(id, url, token);
}
