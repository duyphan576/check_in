// ignore_for_file: unused_field

import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/models/detail/detail.dart';
import 'package:check_in/models/documents/documents.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/detail/repository/detail_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailController extends GetxController
    with CacheManager, GetSingleTickerProviderStateMixin {
  final DetailRepository detailRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  GetStorage storage = GetStorage();
  var classData;
  double? _progress;
  String _status = '';
  RxBool isLoading = true.obs;
  RxBool isStuClick = false.obs;
  RxBool isDocClick = false.obs;
  final classroomId = Get.arguments;
  String? grade;
  String? semester;
  Classroom? classroom;
  final RxList<Students> studentsList = RxList<Students>();
  final RxList<Documents> docList = RxList<Documents>();
  late TabController tabController;
  DetailController({required this.detailRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
    initData();
  }

  initData() async {
    loadDetails();
  }

  void loadDetails() async {
    final response = await detailRepository.detail(
      {
        "classroomId": classroomId,
      },
      UrlProvider.HANDLES_DETAIL,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response!.status == 1) {
      classData = response.data;
      getDetails();
      isLoading.value = false;
    } else {
      Alert.showError(
        title: AppString.ERROR,
        buttonText: CommonString.OK,
        message: response.message!,
      );
    }
  }

  void getDetails() {
    Detail? detail = Detail.fromJson(classData);
    grade = detail.grade;
    semester = detail.semester;
    classroom = detail.classroom;
    List<Students>? studentData = detail.studentList;
    studentsList.assignAll(studentData!);

    List<Documents>? docData = detail.documentList;
    docList.assignAll(docData!);
  }

  void goToStatistical(String classroomId) {
    var argument = <String, dynamic>{
      "classroomId": "$classroomId",
      "isClassroom": true,
    };
    Get.toNamed(Routes.STATISTICAL, arguments: argument);
  }

  void viewPdf(String url) {
    storage.write("url", url);
    Get.toNamed(Routes.PDF);
  }
}
