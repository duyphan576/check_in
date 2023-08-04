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
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

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
  String? grade;
  Classroom? classroom;
  final RxList<Students> studentsList = RxList<Students>();
  final RxList<Documents> docList = RxList<Documents>();
  late TabController tabController;
  DetailController({required this.detailRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    initData();
  }

  initData() async {
    classData = await cacheGet(CacheManagerKey.CLASS_DATA);
    if (classData != null) {
      isLoading.value = false;
      getDetails();
    }
  }

  void getDetails() {
    Detail? detail = Detail.fromJson(classData);
    grade = detail.grade;
    classroom = detail.classroom;
    List<Students>? studentData = detail.studentList;
    studentsList.assignAll(studentData!);
    List<Documents>? docData = detail.documentList;
    docList.assignAll(docData!);
  }

  Future<void> downloadDocument(String url, String fileName) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      FileDownloader.downloadFile(
          url: url,
          name: fileName,
          onProgress: (name, progress) {
            _progress = progress;
            _status = 'Progress: $progress%';
          },
          onDownloadCompleted: (path) {
            _progress = null;
            _status = 'File downloaded to: $path';
          },
          onDownloadError: (error) {
            _progress = null;
            _status = 'Download error: $error';
            Alert.showError(
                title: "title", message: "message", buttonText: "buttonText");
          }).then((file) {
        OpenFile.open(file!.path);
      });
    } else {
      Alert.showError(
          title: "Fail",
          message: "Chưa cấp quyền cho ứng dụng",
          buttonText: "Xác nhận");
    }
  }

  void showInfo(Classroom classroom) {
    Alert.showInfo(
      title: classroom.term!.termName!,
      buttonText: CommonString.OK,
      classroom: classroom,
    );
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
