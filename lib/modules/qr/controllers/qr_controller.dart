import 'package:check_in/core/index.dart';
import 'package:check_in/modules/qr/repository/qr_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrController extends GetxController
    with CacheManager, GetSingleTickerProviderStateMixin {
  final QrRepository qrRepository;
  GetStorage box = GetStorage();
  MobileScannerController cameraController = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    // facing: CameraFacing.front,
    detectionSpeed: DetectionSpeed.normal,
    detectionTimeoutMs: 1000,
    returnImage: false,
    torchEnabled: false,
  );
  RxList<Barcode> barcode = RxList<Barcode>();
  RxBool isStarted = true.obs;
  RxBool isLoading = false.obs;

  late AnimationController _animationController;
  late Animation<double> _animationScanner;
  final duration = const Duration(milliseconds: 3000);
  Color color1 = Colors.blue.withOpacity(0.5);
  Color color2 = Colors.lightBlue.withOpacity(0.0);

  QrController({required this.qrRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initAnimation();
    _initData();
  }

  _initAnimation() {
    _animationController = AnimationController(duration: duration, vsync: this);

    _animationScanner = Tween<double>(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear))
      ..addListener(() => update());
    _animationController.repeat(reverse: true);
  }

  _initData() async {
    // bool isGrantedCamera = await requestWifiInfoPermissions();
    // if (isGrantedCamera) {
    //   isLoading.value = false;
    // }
  }

  saveToken(String? token) {
    if (token != null) {
      box.write("checkinToken", token);
      Get.back(result: token);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  double get animationScanner => _animationScanner.value;

  Color get firstColor =>
      _animationController.status == AnimationStatus.reverse ? color2 : color1;

  Color get secondColor =>
      _animationController.status == AnimationStatus.reverse ? color1 : color2;
}
