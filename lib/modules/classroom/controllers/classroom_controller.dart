import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/class_by_semester/class_by_semester.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/modules/classroom/models/classroom_model.dart';
import 'package:check_in/modules/classroom/repository/classroom_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ClassroomController extends GetxController with CacheManager {
  final ClassroomRepository classroomRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  final RxList<Classroom> classrooms = RxList<Classroom>();
  RxBool isLoading = true.obs;
  RxBool isReady = false.obs;

  final RxList<ClassBySemester> classBySemesterList = RxList<ClassBySemester>();
  final keyClassBySemester = GlobalKey<DropdownSearchState<ClassBySemester>>();

  ClassroomController({required this.classroomRepository});

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    getClass();
  }

  void getClass() async {
    isLoading.value = true;
    classBySemesterList.value = [];
    final response = await classroomRepository.classroom(
      ClassroomModel(),
      UrlProvider.HANDLES_CLASSROOM,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.statusCode == HttpStatus.ok) {
      if (response?.status == 1) {
        isLoading.value = false;
        for (final list in response?.data) {
          ClassBySemester classBySemester = ClassBySemester.fromJson(list);
          classBySemesterList.add(classBySemester);
          if (classBySemesterList.isNotEmpty == true) {
            getClassBySemester(classBySemesterList[0].idSemester);
          }
        }
      } else {
        isLoading.value = false;
        Alert.showError(
          title: CommonString.ERROR,
          buttonText: CommonString.OK,
          message: response!.message.toString(),
        );
      }
    } else {
      isLoading.value = false;
      Alert.showError(
        title: CommonString.ERROR,
        buttonText: CommonString.OK,
        message: response!.message.toString(),
      ).then(
        (value) => Get.back(),
      );
    }
  }

  void getClassBySemester(String? value) async {
    if (value != null) {
      classrooms.assignAll(
        classBySemesterList
            .firstWhere(
              (element) => element.idSemester == value,
            )
            .classroomList!,
      );
    }
  }

  getClassInfo(String classroomId) async {
    Get.toNamed(Routes.DETAIL, arguments: classroomId);
  }
}
