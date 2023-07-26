import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/classroom/classroom.dart';

import 'package:check_in/models/documents/documents.dart';
import 'package:check_in/models/lecturer/lecturer.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/statistical/repository/statistical_repository.dart';
import 'package:check_in/services/authenticationService.dart';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class StatisticalController extends GetxController with CacheManager {
  final StatisticalRepository statisticalRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  int ClassroomId = int.parse(Get.arguments.toString());
  StatisticalController({required this.statisticalRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
    print(ClassroomId);
  }

  initData() async {
    // classData = await cacheGet(CacheManagerKey.CLASS_DATA);
    // if (classData != null) {
    //   isLoading.value = false;
    //   // getDetails();
    // }
  }
  // void getDetails() {
  //   Detail? detail = Detail.fromJson(classData);
  //   grade = detail.grade;
  //   classroom = detail.classroom;
  //   List<Students>? studentData = detail.studentList;
  //   studentsList.assignAll(studentData);
  //   List<Documents>? docData = detail.documentList;
  //   docList.assignAll(docData);
  // }

  // Future<void> DownloadDocument(String url, String fileName) async {
  //   var status = await Permission.storage.request();
  //   if (status.isGranted) {
  //     FileDownloader.downloadFile(
  //         url: url,
  //         name: fileName,
  //         onProgress: (name, progress) {
  //           _progress = progress;
  //           _status = 'Progress: $progress%';
  //         },
  //         onDownloadCompleted: (path) {
  //           _progress = null;
  //           _status = 'File downloaded to: $path';
  //         },
  //         onDownloadError: (error) {
  //           _progress = null;
  //           _status = 'Download error: $error';
  //           Alert.showError(
  //               title: "title", message: "message", buttonText: "buttonText");
  //         }).then((file) {
  //       OpenFile.open(file!.path);
  //     });
  //   } else {
  //     Alert.showError(
  //         title: "Fail",
  //         message: "Chưa cấp quyền cho ứng dụng",
  //         buttonText: "Xác nhận");
  //   }
  // }
}
