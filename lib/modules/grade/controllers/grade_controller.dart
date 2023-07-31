import 'package:check_in/constants/index.dart';
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
  List<double> gradeFinalList = [];
  RxList<Grade> grades = <Grade>[].obs;
  double? gradeFinal;
  GradeController({required this.gradeRepository});

  @override
  void onInit() async {
    super.onInit();
    initData();
    avgGrade = getAvgGrade();
    getGradesData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = true;
    }
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
    if (response?.status == 1) {
      List<dynamic> gradeList = response?.data['grades'];
      List<Grade> gradesData =
          gradeList.map((json) => Grade.fromJson(json)).toList();
      // Sử dụng assignAll() hoặc addAll() để cập nhật RxList mà không thay đổi kiểu dữ liệu
      grades.addAll(gradesData);
      update();
      for (int i = 0; i < grades.length; i++) {
        gradeFinal = grades[i].finalGrade;
        gradeFinalList.add(gradeFinal!);
      }
      print(gradeFinalList);

      isLoading.value = false;
    } else {
      Alert.showSuccess(
          title: AppString.ERROR,
          buttonText: AppString.CANCEL,
          message: response?.message.toString());
    }
  }
}
