import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/checkin/models/checkin_model.dart';
import 'package:check_in/modules/checkin/repository/checkin_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:network_info_plus/network_info_plus.dart';

class CheckinController extends GetxController with CacheManager {
  final CheckinRepository checkinRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;

  CheckinController({required this.checkinRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  initData() async {
    final info = NetworkInfo();

    final wifiName = await info.getWifiName(); // "FooNetwork"
    final wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
    final wifiIP = await info.getWifiIP(); // 192.168.1.43

    print(wifiName);
    print(wifiBSSID);
    print(wifiIP);
  }
}
