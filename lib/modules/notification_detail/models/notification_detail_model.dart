import 'package:check_in/core/base_api_model.dart';

class NotificationDetailModel extends BaseApiModel {
  NotificationDetailModel({
    this.userId,
    this.detail,
    act,
    plus,
  }) : super(act: act, plus: plus);
  String? userId;
  String? detail;

  factory NotificationDetailModel.initial() {
    return NotificationDetailModel(
      userId: '',
      detail: '',
      act: '',
      plus: "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "detail": detail,
      "act": act,
      "plus": plus,
    };
  }

  factory NotificationDetailModel.fromJson(Map<String, dynamic> json) {
    return NotificationDetailModel(
      detail: json["detail"] ?? "",
    );
  }
}
