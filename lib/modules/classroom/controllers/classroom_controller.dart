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
  RxBool isLoading = true.obs;

  ClassroomController({required this.classroomRepository});

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

  Stream<List<Classroom>> getStreamOfData() async* {
    final response = await classroomRepository.classroom(ClassroomModel(),
        UrlProvider.HANDLES_CLASSROOM, cacheGet(CacheManagerKey.TOKEN));
    // Parse the JSON data into Dart objects
    final List<dynamic> classroomList = response?.data['classrooms'];
    // Convert the JSON objects to Classroom objects
    final List<Classroom> classrooms =
        classroomList.map((json) => Classroom.fromJson(json)).toList();

    // Yield the classrooms list to the stream
    yield classrooms;
  }
}
