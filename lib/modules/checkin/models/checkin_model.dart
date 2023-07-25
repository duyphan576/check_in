import 'package:check_in/core/base_api_model.dart';

class CheckinModel extends BaseApiModel {
  CheckinModel({
    required this.token,
    required this.wifiName,
    required this.wifiBSSID,
    required this.wifiIP,
    act,
    plus,
  }) : super(act: act, plus: plus);
  String token;
  String wifiName;
  String wifiBSSID;
  String wifiIP;

  factory CheckinModel.initial() {
    return CheckinModel(
      token: '',
      wifiName: '',
      wifiBSSID: '',
      wifiIP: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "token": token,
      "wifiName": wifiName,
      "wifiBSSID": wifiBSSID,
      "wifiIP": wifiIP,
      "act": act,
      "plus": plus,
    };
  }
}
