import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/models/detail/detail.dart';
import 'package:check_in/models/documents/documents.dart';
import 'package:check_in/models/lecturer/lecturer.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/detail/repository/detail_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:get/get.dart';

class DetailController extends GetxController with CacheManager {
  final DetailRepository detailRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var classData;
  RxBool isLoading = true.obs;
  RxBool isStuClick = false.obs;
  RxBool isDocClick = false.obs;
  String? grade;
  Classroom? classroom;
  final RxList<Students> studentsList = RxList<Students>();
  final RxList<Documents> docList = RxList<Documents>();
  DetailController({required this.detailRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  initData() async {
    classData = await cacheGet(CacheManagerKey.CLASS_DATA);
    if (classData != null) {
      isLoading.value = false;
      printGradeDetails();
    }
  }

  void printGradeDetails() {
    Detail? detail = Detail.fromJson(classData);
    grade = detail.grade;
    classroom = detail.classroom;
    List<Students>? studentData = detail.studentList;
    studentsList.assignAll(studentData);
    List<Documents>? docData = detail.documentList;
    docList.assignAll(docData);
  }
}
