import 'package:check_in/core/base_api_model.dart';

class NotificationDetailModel extends BaseApiModel {
  NotificationDetailModel({
    act,
    plus,
  }) : super(act: act, plus: plus);

  factory NotificationDetailModel.initial() {
    return NotificationDetailModel(
      act: '',
      plus: "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "act": act,
      "plus": plus,
    };
  }
}
