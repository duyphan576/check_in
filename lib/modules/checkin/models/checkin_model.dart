import 'package:check_in/core/base_api_model.dart';

class CheckinModel extends BaseApiModel {
  CheckinModel({
    required this.token,
    required this.wifiName,
    required this.wifiBSSID,
    act,
    plus,
  }) : super(act: act, plus: plus);
  String token;
  String wifiName;
  String wifiBSSID;

  factory CheckinModel.initial() {
    return CheckinModel(
      token: '',
      wifiName: '',
      wifiBSSID: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "token": token,
      "wifiName": wifiName,
      "wifiBSSID": wifiBSSID,
      "act": act,
      "plus": plus,
    };
  }
}
