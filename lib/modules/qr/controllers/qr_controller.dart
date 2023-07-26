import 'dart:convert';

import 'package:check_in/core/index.dart';
import 'package:check_in/modules/qr/repository/qr_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/global_service.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrController extends GetxController with CacheManager {
  final QrRepository qrRepository;
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

  QrController({required this.qrRepository});
  void startOrStop() {
    if (isStarted.value) {
      cameraController.stop();
    } else {
      cameraController.start();
    }
    isStarted.value = !isStarted.value;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
