import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/checkin/repository/checkin_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckinController extends GetxController with CacheManager {
  final CheckinRepository checkinRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;
  MobileScannerController cameraController = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    // facing: CameraFacing.front,
    detectionSpeed: DetectionSpeed.normal,
    detectionTimeoutMs: 1000,
    returnImage: false,
    torchEnabled: false,
  );
  var barcode;
  RxBool isStarted = true.obs;
  RxBool isScan = false.obs;

  CheckinController({required this.checkinRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  void startOrStop() {
    try {
      if (isStarted.value) {
        cameraController.stop();
      } else {
        cameraController.start();
      }
      isStarted.value = !isStarted.value;
    } on Exception catch (e) {}
  }

  void isClose() {
    isScan.value = false;
  }

  initData() async {
    final info = NetworkInfo();

    bool isGranted = await requestWifiInfoPermisson();
    if (isGranted) {
      String? wifiName = await info.getWifiName(); // FooNetwork
      String? wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
      String? wifiIP = await info.getWifiIP();
      print(wifiName);
      print(wifiBSSID);
      print(wifiIP);
      isLoading.value = false;
      print(isLoading.value);
    }
  }

  Future<bool> requestWifiInfoPermisson() async {
    // ignore: avoid_print
    print('Checking Android permissions');
    PermissionStatus status = await Permission.location.status;
    // Blocked?
    if (status.isDenied || status.isRestricted) {
      // Ask the user to unblock
      if (await Permission.location.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        // ignore: avoid_print
        print('Location permission granted');
        return true;
      } else {
        // ignore: avoid_print
        print('Location permission not granted');
        return false;
      }
    } else {
      // ignore: avoid_print
      print('Permission already granted (previous execution?)');
      return true;
    }
  }
}
