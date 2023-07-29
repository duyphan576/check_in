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
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
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
  final keyHistoryCheckIn = GlobalKey<DropdownSearchState<CheckinHistory>>();

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
  RxBool isReady = false.obs;
  RxList<Classroom> classroom = RxList<Classroom>();
  RxList<CheckinDate> checkinDate = RxList<CheckinDate>();
  final RxList<CheckinHistory> listCheckHistory = RxList<CheckinHistory>();

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
    getCheckinHistory();
  }

  void checkin(String? token) async {
    if (token != null) {
      final submit = {
        "token": token,
        "wifiName": wifiName.value,
        "wifiBSSID": wifiBSSID.value,
      };
      final response = await checkinRepository.checkin(
        submit,
        UrlProvider.HANDLES_CHECKIN,
        cacheGet(CacheManagerKey.TOKEN),
      );

      if (response?.status == 1) {
        isLoading.value = false;
        Alert.showSuccess(
          title: CommonString.SUCCESS,
          buttonText: CommonString.OK,
          message: response?.message,
        ).then((value) => getCheckinHistory());
      } else {
        isLoading.value = false;
        Alert.showSuccess(
          title: CommonString.ERROR,
          buttonText: CommonString.OK,
          message: response?.message,
        );
      }
    }
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
          Get.toNamed(Routes.QR)?.then((value) {
            checkin(value);
          });
        }
      }
    }
  }

  Future<bool> requestWifiInfoPermissions() async {
    PermissionStatus status = await Permission.camera.status;

    if (status.isDenied || status.isRestricted) {
      if (await Permission.camera.request().isGranted) {
        return true;
      } else {
        Alert.showErrorGeolocator(
          title: CommonString.ERROR,
          message: AppString.CAMERA_ERROR,
          buttonTextOK: AppString.GO_TO_SETTINGS,
          buttonTextCancel: CommonString.CANCEL,
          onPressed: () {
            openAppSettings();
            Get.back();
          },
        );
        return false;
      }
    } else {
      return true;
    }
  }

  void getCheckinHistory() async {
    final response = await checkinRepository.history(
      UrlProvider.HANDLES_HISTORY,
      cacheGet(CacheManagerKey.TOKEN),
    );
    print(response?.toMap());
    if (response?.status == 1) {
      for (final list in response?.data["checkedInList"]) {
        CheckinHistory history = CheckinHistory.fromJson(list);
        listCheckHistory.add(history);
        if (listCheckHistory != null && listCheckHistory.isNotEmpty == true) {
          isReady.value = true;
          getDateCheckin(listCheckHistory[0].classroom.id.toString());
        }
      }
      isLoading.value = false;
    } else {
      Alert.showSuccess(
        title: CommonString.ERROR,
        buttonText: CommonString.OK,
        message: response?.message,
      );
      isLoading.value = false;
    }
  }

  void getDateCheckin(String? value) {
    if (value != null) {
      checkinDate.assignAll(listCheckHistory
          .firstWhere(
            (element) => element.classroom.id.toString() == value,
          )
          .checkinDate);
    }
  }

  getFormatDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}
