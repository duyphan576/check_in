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
    // TODO: implement onInit
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
    final response = await classroomRepository.getClassroom(
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
    print(classroomId);
    final response = await classroomRepository.postGradeList(
      classroomId,
      UrlProvider.HANDLES_DETAIL,
      cacheGet(CacheManagerKey.TOKEN),
    );
    print(response?.data["studentList"]);
    if (response?.statusCode == HttpStatus.ok) {
      if (response?.status == 1) {
        cacheSave(CacheManagerKey.CLASS_DATA, response?.data);
        Get.toNamed(Routes.DETAIL);
      }
    }
  }
}
