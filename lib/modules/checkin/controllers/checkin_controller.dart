import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/checkin_date/checkin_date.dart';
import 'package:check_in/models/checkin_history/checkin_history.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/models/list_history/list_history.dart';
import 'package:check_in/modules/checkin/repository/checkin_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
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
  RxBool isClick = false.obs;
  final RxList<Classroom> classroom = RxList<Classroom>();
  final RxList<CheckinDate> checkinDate = RxList<CheckinDate>();

  CheckinController({required this.checkinRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  initData() async {
    final info = NetworkInfo();

    bool isGranted = await requestWifiInfoPermisson();
    if (isGranted) {
      wifiName.value = (await info.getWifiName())!; // FooNetwork
      wifiBSSID.value = (await info.getWifiBSSID())!; // 11:22:33:44:55:66
      print("Name $wifiName");
      print("BSSID $wifiBSSID");
      final token = box.read("checkinToken");
      if (token != null) {
        box.remove("checkinToken");
        checkin(token);
        getCheckinHistory();
      } else {
        getCheckinHistory();
      }
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
        classroom.add(history.classroom);
        checkinDate.assignAll(history.checkinDate);
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

  void checkin(String? token) async {
    final response = await checkinRepository.checkin(
      // {
      //   "token":
      //       "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGFzc3Jvb21JZCI6IjEiLCJleHAiOjE2OTI3NzE4MDl9.6z0GDq9j8kexLttZsceMY-az6YB0B2qsw8P7bLhqSkc",
      //   "wifiName": '"Tenda_7EB5B0_5G"',
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
    } else {
      Alert.showSuccess(
        title: CommonString.ERROR,
        buttonText: CommonString.OK,
        message: response?.message,
      );
    }
  }

  Future<bool> requestWifiInfoPermisson() async {
    print('Checking Android permissions');
    PermissionStatus status = await Permission.location.status;
    if (status.isDenied || status.isRestricted) {
      if (await Permission.location.request().isGranted) {
        print('Location permission granted');
        return true;
      } else {
        print('Location permission not granted');
        return false;
      }
    } else {
      print('Permission already granted (previous execution?)');
      return true;
    }
  }

  getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}
