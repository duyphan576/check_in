import 'dart:convert';
import 'package:check_in/core/index.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../models/grade/grade.dart';
import '../repository/grade_repository.dart';

class GradeController extends GetxController with CacheManager {
  final GradeRepository gradeRepository;
  var userData;
  RxBool isLoading = true.obs;

  GradeController({required this.gradeRepository});

  @override
  void onInit() async {
    initData();
    super.onInit();
  }

  Stream<List<Grade>> getStreamOfData() async* {
    final _connect = GetConnect();
    String url = '${Api.baseUrl}${Api.gradeApi.gradestu}';
    final gradesJson = await _connect.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final List<dynamic> gradesList = gradesJson.body['marks'];
    print(gradesJson.body);

    // Convert the JSON objects to Classroom objects
    final List<Grade> grades =
        gradesList.map((json) => Grade.fromJson(json)).toList();

    // Yield the classrooms list to the stream
    yield grades;
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }
}
