import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/checkin/repository/checkin_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckinController extends GetxController
    with CacheManager, GetSingleTickerProviderStateMixin {
  final CheckinRepository checkinRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;
  GetStorage box = GetStorage();

  MobileScannerController cameraController = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    // facing: CameraFacing.front,
    detectionSpeed: DetectionSpeed.normal,
    detectionTimeoutMs: 1000,
    returnImage: false,
    torchEnabled: false,
  );
  RxList<Barcode> listBarcode = RxList<Barcode>();
  RxString wifiName = "".obs;
  RxString wifiBSSID = "".obs;
  var infoWifi;
  RxBool isStarted = true.obs;
  CheckinController({required this.checkinRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  initData() async {
    infoWifi = await Utils.getWifiName();
    await requestWifiInfoPermissions();
    if (infoWifi != null) {
      wifiName.value = infoWifi["wifiName"];
      wifiBSSID.value = infoWifi["bssidWifi"];
    }
    isLoading.value = false;
  }

  void checkin(String? token) async {
    isLoading.value = true;
    final submit = {
      "token": token,
      "wifiName": wifiName.value,
      "wifiBSSID": wifiBSSID.value,
    };
    print("checkincheckincheckin");
    print(submit);
    final response = await checkinRepository.checkin(
      submit,
      UrlProvider.HANDLES_CHECKIN,
      cacheGet(CacheManagerKey.TOKEN),
    );

    if (response?.status == 1) {
      isLoading.value = false;
      Alert.showSuccess(
        title: CheckinString.CHECK_IN,
        buttonText: CommonString.OK,
        message: response?.message,
      );
    } else
      isLoading.value = false;
    Alert.showSuccess(
      title: CommonString.ERROR,
      buttonText: CommonString.OK,
      message: response?.message,
    );
  }

  handleOpenCamera() async {
    if (wifiName.value.isNotEmpty == true) {
      bool isGrantedCamera = await requestWifiInfoPermissions();
      if (isGrantedCamera) {
        Get.toNamed(Routes.QR)?.then((value) => checkin(value));
      }
    } else {
      infoWifi = await Utils.getWifiName();
      if (infoWifi != null) {
        wifiName.value = infoWifi["wifiName"];
        wifiBSSID.value = infoWifi["bssidWifi"];
        bool isGrantedCamera = await requestWifiInfoPermissions();
        if (isGrantedCamera) {
          Get.toNamed(Routes.QR)?.then((value) => checkin(value));
        }
      }
    }
  }

  Future<bool> requestWifiInfoPermissions() async {
    print('Checking Android permissions');
    PermissionStatus status = await Permission.camera.status;

    if (status.isDenied || status.isRestricted) {
      if (await Permission.camera.request().isGranted) {
        print('Camera permission granted');
        return true;
      } else {
        print('Camera permission not granted');
        Alert.showErrorGeolocator(
          title: "Lỗi",
          message: "Ứng dụng không cho phép truy cập Camera.",
          buttonTextOK: "Mở cài đặt ứng dụng",
          buttonTextCancel: "Cancel",
          onPressed: () {
            openAppSettings();
            Get.back();
          },
        );
        return false;
      }
    } else {
      print('Camera already granted (previous execution?)');
      return true;
    }
  }
}
