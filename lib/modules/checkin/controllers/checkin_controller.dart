import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/checkin_date/checkin_date.dart';
import 'package:check_in/models/checkin_history/checkin_history.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/modules/checkin/repository/checkin_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:check_in/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckinController extends GetxController with CacheManager {
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
  RxList<Barcode> barcode = RxList<Barcode>();
  RxString wifiName = "".obs;
  RxString wifiBSSID = "".obs;
  var infoWifi;
  RxBool isStarted = true.obs;
  RxBool isClick = false.obs;
  RxBool isReady = false.obs;
  RxList<Classroom> classroom = RxList<Classroom>();
  RxList<CheckinDate> checkinDate = RxList<CheckinDate>();
  final RxList<CheckinHistory> checkHistory = RxList<CheckinHistory>();
  RxString chooseItem = "1".obs;
  RxString termName = "".obs;

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
      getCheckinHistory();
    } else {
      getCheckinHistory();
      isLoading.value = false;
    }
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

  void getCheckinHistory() async {
    final response = await checkinRepository.history(
      UrlProvider.HANDLES_HISTORY,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      for (final list in response?.data["checkedInList"]) {
        CheckinHistory history = CheckinHistory.fromJson(list);
        checkHistory.add(history);
        // classroom.add(history.classroom);
        // checkinDate.addAll(history.checkinDate);
      }

      isLoading.value = false;
    } else {
      Alert.showSuccess(
        title: CommonString.ERROR,
        buttonText: CommonString.OK,
        message: response?.message,
      );
    }
  }

  void getDateCheckin(String? value) {
    if (value != null) {
      checkinDate.assignAll(checkHistory
          .firstWhere(
            (element) => element.classroom.id.toString() == value,
          )
          .checkinDate);
      chooseItem.value = value;
    }
  }

  // void checkin(String? token) async {
  //   final response = await checkinRepository.checkin(
  //     // {
  //     //   "token":
  //     //       "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGFzc3Jvb21JZCI6IjEiLCJleHAiOjE2OTI3NzE4MDl9.6z0GDq9j8kexLttZsceMY-az6YB0B2qsw8P7bLhqSkc",
  //     //   "wifiName": '"Tenda_7EB5B0_5G"',
  //     //   "wifiBSSID": 'c8:3a:35:7e:b5:b6',
  //     // },
  //     {
  //       "token": token,
  //       "wifiName": wifiName.value,
  //       "wifiBSSID": wifiBSSID.value,
  //     },
  //     UrlProvider.HANDLES_CHECKIN,
  //     cacheGet(CacheManagerKey.TOKEN),
  //   );
  //   if (response?.status == 1) {
  //     Alert.showSuccess(
  //       title: CheckinString.CHECK_IN,
  //       buttonText: CommonString.OK,
  //       message: response?.message,
  //     );
  //   } else {
  //     Alert.showSuccess(
  //       title: CommonString.ERROR,
  //       buttonText: CommonString.OK,
  //       message: response?.message,
  //     );
  //   }
  // }

  // Future<bool> requestWifiInfoPermisson() async {
  //   print('Checking Android permissions');
  //   PermissionStatus status = await Permission.location.status;
  //   if (status.isDenied || status.isRestricted) {
  //     if (await Permission.location.request().isGranted) {
  //       print('Location permission granted');
  //       return true;
  //     } else {
  //       print('Location permission not granted');
  //       return false;
  //     }
  //   } else {
  //     print('Permission already granted (previous execution?)');
  //     return true;
  //   }
  // }

  getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}
