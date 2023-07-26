import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/checkin/repository/checkin_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
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
  RxList<Barcode> barcode = RxList<Barcode>();
  RxBool isStarted = true.obs;
  RxString wifiName = "".obs;
  RxString wifiBSSID = "".obs;
  RxString wifiIP = "".obs;

  CheckinController({required this.checkinRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  void startOrStop() {
    if (isStarted.value) {
      cameraController.stop();
    } else {
      cameraController.start();
    }
    isStarted.value = !isStarted.value;
  }

  initData() async {
    final info = NetworkInfo();

    bool isGranted = await requestWifiInfoPermisson();
    if (isGranted) {
      wifiName.value = (await info.getWifiName())!; // FooNetwork
      wifiBSSID.value = (await info.getWifiBSSID())!; // 11:22:33:44:55:66
      wifiIP.value = (await info.getWifiIP())!;
      isLoading.value = false;
      print("Name $wifiName");
      print("BSSID $wifiBSSID");
    }
  }

  void checkin(String? token) async {
    print(token);
    final response = await checkinRepository.checkin(
      // {
      //   "token":
      //       "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGFzc3Jvb21JZCI6IjEiLCJleHAiOjE2OTI3NzE4MDl9.6z0GDq9j8kexLttZsceMY-az6YB0B2qsw8P7bLhqSkc",
      //   "wifiName": 'Tenda_7EB5B0_5G',
      //   "wifiBSSID": 'c8:3a:35:7e:b5:b6',
      // },
      {
        "token": token,
        "wifiName": wifiName.value,
        "wifiBSSID": wifiBSSID.value,
      },
      UrlProvider.HANDLES_CHECKIN,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      Alert.showSuccess(
        title: CheckinString.CHECK_IN,
        buttonText: CommonString.OK,
        message: response?.message,
      );
    } else
      Alert.showSuccess(
        title: CommonString.ERROR,
        buttonText: CommonString.OK,
        message: response?.message,
      );
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
