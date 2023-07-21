import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/models/detail/detail.dart';
import 'package:check_in/models/documents/documents.dart';
import 'package:check_in/models/lecturer/lecturer.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/detail/repository/detail_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailController extends GetxController with CacheManager {
  final DetailRepository detailRepository;
  final AuthenticationService authenticationService = AuthenticationService();
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
      getDetails();
    }
  }

  void getDetails() {
    Detail? detail = Detail.fromJson(classData);
    grade = detail.grade;
    classroom = detail.classroom;
    List<Students>? studentData = detail.studentList;
    studentsList.assignAll(studentData);
    List<Documents>? docData = detail.documentList;
    docList.assignAll(docData);
  }

  Future<void> DownloadDocument(String url, String fileName) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      FileDownloader.downloadFile(
          url: url,
          name: fileName,
          onProgress: (name, progress) {
            _progress = progress;
            _status = 'Progress: $progress%';
            final snackBar = SnackBar(
              content: Text(_status, style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
            );
            ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
          },
          onDownloadCompleted: (path) {
            _progress = null;
            _status = 'File downloaded to: $path';
            final snackBar = SnackBar(
              content: Text('File downloaded to: $path',
                  style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
            );
            ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
            OpenFile.open(path);
          },
          onDownloadError: (error) {
            _progress = null;
            _status = 'Download error: $error';
            final snackBar = SnackBar(
              content: Text(
                'Download error: $error',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            );
            ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
          }).then((file) {
        print("${file?.path}");
      });
    } else {
      print(
          "Quyền bị từ chối, hiển thị thông báo hoặc hướng dẫn người dùng cấp quyền");
    }
  }
}
