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
    getGradesData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = true;
    }
  }

  Future<void> getGradesData() async {
    final response = await gradeRepository.grade(
      GradeModel(),
      UrlProvider.HANDLES_GRADE,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      List<dynamic> gradeList = response?.data['grades'];
      avgGrade = response?.data['avgGrade'];
      List<Grade> gradesData =
          gradeList.map((json) => Grade.fromJson(json)).toList();

      grades.addAll(gradesData);
      for (int i = 0; i < grades.length; i++) {
        gradeFinal = grades[i].finalGrade;
        gradeFinalList.add(gradeFinal!);
      }
      update();
      isLoading.value = false;
    } else {
      Alert.showError(
          title: AppString.ERROR,
          buttonText: AppString.CANCEL,
          message: response!.message.toString());
    }
  }
}
