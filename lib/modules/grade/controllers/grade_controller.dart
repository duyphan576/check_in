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
  GradeController({required this.gradeRepository});

  @override
  void onInit() async {
    initData();
    avgGrade = getAvgGrade();
    super.onInit();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  getAvgGrade() async {
    final respone = await gradeRepository.grade(GradeModel(),
        UrlProvider.HANDLES_GRADE, cacheGet(CacheManagerKey.TOKEN));
    avgGrade = respone?.data['avgGrade'];
  }

  Stream<List<Grade>> getStreamOfData() async* {
    final respone = await gradeRepository.grade(GradeModel(),
        UrlProvider.HANDLES_GRADE, cacheGet(CacheManagerKey.TOKEN));
    final List<dynamic> gradeList = respone?.data['grades'];
    // Convert the JSON objects to Classroom objects
    final List<Grade> grades =
        gradeList.map((json) => Grade.fromJson(json)).toList();

    // Yield the classrooms list to the stream
    yield grades;
  }
}
