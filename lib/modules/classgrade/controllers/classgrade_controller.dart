import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/classgrade/classgrade.dart';
import 'package:check_in/modules/classgrade/models/classgrade_model.dart';
import 'package:check_in/modules/classgrade/repository/classgrade_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ClassgradeController extends GetxController with CacheManager {
  final ClassgradeRepository classgradeRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;

  ClassgradeController({required this.classgradeRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  // Stream<List<Classgrade>> getStreamOfData() async* {
  //   final response = await classgradeRepository.classgrade(ClassgradeModel(),
  //       UrlProvider.HANDLES_CLASSROOM, cacheGet(CacheManagerKey.TOKEN));
  //   // Parse the JSON data into Dart objects
  //   final List<dynamic> classgradeList = response?.data['classgrades'];
  //   // Convert the JSON objects to Classgrade objects
  //   final List<Classgrade> classgrades =
  //       classgradeList.map((json) => Classgrade.fromJson(json)).toList();

  //   // Yield the classgrades list to the stream
  //   yield classgrades;
  // }
}
