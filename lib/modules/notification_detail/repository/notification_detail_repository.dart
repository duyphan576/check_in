import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/notification_detail/models/notification_detail_model.dart';
import 'package:check_in/modules/notification_detail/providers/notification_detail_provider.dart';

class NotificationDetailRepository {
  NotificationDetailRepository({required this.notificationDetailProvider});

  final NotificationDetailProvider notificationDetailProvider;

  Future<BaseResponse?> loadData(
          NotificationDetailModel notificationDetailModel, url, token) =>
      notificationDetailProvider.loadData(notificationDetailModel, url, token);
}
