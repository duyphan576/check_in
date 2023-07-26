import 'package:check_in/core/index.dart';
import 'package:check_in/modules/grade/models/grade_models.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:get/get.dart';
import '../../../models/grade/grade.dart';
import '../repository/grade_repository.dart';

class GradeController extends GetxController with CacheManager {
  final GradeRepository gradeRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;
  var avgGrade;
  RxList<Grade> grades = <Grade>[].obs;
  GradeController({required this.gradeRepository});

  @override
  void onInit() async {
    initData();
    avgGrade = getAvgGrade();
    getGradesData();
    super.onInit();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
  }

  getAvgGrade() async {
    final respone = await gradeRepository.grade(GradeModel(),
        UrlProvider.HANDLES_GRADE, cacheGet(CacheManagerKey.TOKEN));
    avgGrade = respone?.data['avgGrade'];
    update();
  }

  Future<void> getGradesData() async {
    final response = await gradeRepository.grade(
      GradeModel(),
      UrlProvider.HANDLES_GRADE,
      cacheGet(CacheManagerKey.TOKEN),
    );
    List<dynamic> gradeList = response?.data['grades'];
    List<Grade> gradesData =
        gradeList.map((json) => Grade.fromJson(json)).toList();

    // Sử dụng assignAll() hoặc addAll() để cập nhật RxList mà không thay đổi kiểu dữ liệu
    grades.assignAll(gradesData);
    update();
    isLoading.value = false;
  }
}
