import '../../../core/base_api_model.dart';

class NotificationModel extends BaseApiModel {
  NotificationModel({act, plus}) : super(act: act, plus: plus);

  factory NotificationModel.initial() {
    return NotificationModel(
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "act": act,
      "plus": plus,
    };
  }
}
