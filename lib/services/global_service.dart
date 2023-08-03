// ignore_for_file: unnecessary_null_comparison

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:rxdart/rxdart.dart';

class GlobalService extends GetxService {
  var _token = "";
  final BehaviorSubject<String> notificationData = BehaviorSubject<String>();
  final BehaviorSubject<String> notificationHome = BehaviorSubject<String>();
  final BehaviorSubject<String> navigateNotification =
      BehaviorSubject<String>();

  get token => _token;

  set token(value) {
    _token = value;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() async {
    notificationData.close();
    navigateNotification.close();
    notificationHome.close();
    super.onClose();
  }

  Future<GlobalService> init() async {
    return this;
  }

  bool hasToken() => _token != null;
}
