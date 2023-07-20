import 'dart:convert';

import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/gradelist/gradelist.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/gradelist/repository/gradelist_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:get/get.dart';

class GradelistController extends GetxController with CacheManager {
  final GradelistRepository gradelistRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var classData;
  RxBool isLoading = true.obs;
  RxList<Gradelist> gradelist = RxList<Gradelist>();
  GradelistController({required this.gradelistRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  initData() async {
    classData = await cacheGet(CacheManagerKey.CLASS_DATA);
    print(classData);
    if (classData != null) {
      isLoading.value = false;
    }
  }

  Gradelist parseJsonToGradelist(String jsonData) {
    // Step 1: Parse the JSON data
    Map<String, dynamic> parsedData = jsonDecode(jsonData);

    // Step 2: Create an instance of Gradelist using the factory constructor
    Gradelist gradelist = Gradelist.fromJson(parsedData);

    return gradelist;
  }

  void printGradeDetails(Gradelist gradelist) {
    String grade = gradelist.grade;
    int classroomId = gradelist.classroom.id;
    String lecturerCode = gradelist.classroom.lecturer.code;
    String lecturerFullname = gradelist.classroom.lecturer.fullname;
    String termName = gradelist.classroom.term.termName;
    int termCredit = gradelist.classroom.term.credit;
    List<Students> studentsList = gradelist.studentList;

    // Display the information
    print("Grade: $grade");
    print("Classroom ID: $classroomId");
    print("Lecturer Code: $lecturerCode");
    print("Lecturer Fullname: $lecturerFullname");
    print("Term Name: $termName");
    print("Term Credit: $termCredit");

    // Display information about each student in the student list
    for (Students student in studentsList) {
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
