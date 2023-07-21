import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/detail/detail.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/detail/repository/detail_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:get/get.dart';

class DetailController extends GetxController with CacheManager {
  final DetailRepository detailRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var classData;
  RxBool isLoading = true.obs;
  Detail? detail;
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
    detail = Detail.fromJson(classData);
    String? grade = detail?.grade;
    int? classroomId = detail?.classroom.id;
    String? lecturerCode = detail?.classroom.lecturer.code;
    String? lecturerFullname = detail?.classroom.lecturer.fullname;
    String? termName = detail?.classroom.term.termName;
    int? termCredit = detail?.classroom.term.credit;
    List<Students>? studentsList = detail?.studentList;

    // Display the information
    print("Grade: $grade");
    print("Classroom ID: $classroomId");
    print("Lecturer Code: $lecturerCode");
    print("Lecturer Fullname: $lecturerFullname");
    print("Term Name: $termName");
    print("Term Credit: $termCredit");

    // Display information about each student in the student list
    for (Students student in studentsList!) {
      print("\nStudent ID: ${student.id}");
      print("Student Code: ${student.code}");
      print("Student Fullname: ${student.fullname}");
      print("Student Gender: ${student.gender}");
      print("Student Birthdate: ${student.birthdate}");
      print("Student Phone: ${student.phone}");
      print("Student Email: ${student.email}");
    }
  }
}
