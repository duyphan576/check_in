import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/modules/classroom/models/classroom_model.dart';
import 'package:check_in/modules/classroom/repository/classroom_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ClassroomController extends GetxController with CacheManager {
  final ClassroomRepository classroomRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  final RxList<Classroom> classrooms = RxList<Classroom>();
  RxBool isLoading = true.obs;

  ClassroomController({required this.classroomRepository});

  @override
  void onInit() {
    super.onInit();
    fetchData();
    initData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  Stream<List<Classroom>> getStreamOfData() async* {
    final response = await classroomRepository.classroom(
      ClassroomModel(),
      UrlProvider.HANDLES_CLASSROOM,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.statusCode == HttpStatus.ok) {
      if (response?.status == 1) {
        // Parse the JSON data into Dart objects
        final List<dynamic> classroomList = response?.data['classrooms'];
        // Convert the JSON objects to Classroom objects
        final List<Classroom> classroomData =
            classroomList.map((json) => Classroom.fromJson(json)).toList();
        yield classroomData;
      } else {
        Alert.showError(
          title: CommonString.ERROR,
          message: "You don't have data in any classroom",
          buttonText: CommonString.OK,
        ).then(
          (value) => Get.back(),
        );
      }
    }
  }

  void fetchData() {
    // Assuming `getStreamOfData()` returns the stream you want to listen to
    getStreamOfData().listen((List<Classroom>? data) {
      classrooms.assignAll(data ?? []);
    });
  }

  getClassInfo(String classroomId) async {
    Alert.showLoadingIndicator(message: "Loading");
    final response = await classroomRepository.detail(
      {
        "classroomId": classroomId,
      },
      UrlProvider.HANDLES_DETAIL,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      Alert.closeLoadingIndicator();
      cacheSave(CacheManagerKey.CLASS_DATA, response?.data);
      Get.toNamed(Routes.DETAIL);
    }
  }
}
