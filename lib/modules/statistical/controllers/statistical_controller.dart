import 'package:check_in/constants/index.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/statistical/models/statistical_model.dart';
import 'package:check_in/modules/statistical/repository/statistical_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:get/get.dart';

RxBool isLoading = true.obs;

class StatisticalController extends GetxController with CacheManager {
  final StatisticalRepository statisticalRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  int countLessThan4 = 0;
  int countForm4ToLessThan55 = 0;
  int countForm55ToLessThan7 = 0;
  int countFor7ToLessThan85 = 0;
  int countGreaterThan85 = 0;
  double countLessThan4Percentage = 0.0;
  double countForm4ToLessThan55Percentage = 0.0;
  double countForm55ToLessThan7Percentage = 0.0;
  double countFor7ToLessThan85Percentage = 0.0;
  double countGreaterThan85Percentage = 0.0;
  List<double?> grades = [];
  Map<String, int> count = {};
  RxBool isLoading = true.obs;
  RxList<StatisticalModel> listExam = <StatisticalModel>[].obs;
  RxList<StatisticalModel> listFinal = <StatisticalModel>[].obs;

  StatisticalController({required this.statisticalRepository});

  @override
  void onInit() {
    super.onInit();
    getGradesData();
  }

  void getGradesData() async {
    isLoading.value = true;
    int classroomId = int.parse(Get.arguments['classroomId']);
    final response = await statisticalRepository.statistical(
      StatisticalModel(classroomId: classroomId.toString()),
      UrlProvider.HANDLES_SATISTICAL,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response?.status == 1) {
      final List? _listRequestExam = response?.data["exam"];
      if (_listRequestExam != null && _listRequestExam.isNotEmpty) {
        listExam.value = _listRequestExam
            .map((value) => StatisticalModel.fromJson(value))
            .toList();
      }
      final List? _listRequestFinal = response?.data["final"];
      if (_listRequestFinal != null && _listRequestFinal.isNotEmpty) {
        listFinal.value = _listRequestFinal
            .map((value) => StatisticalModel.fromJson(value))
            .toList();
      }
      update();
      isLoading.value = false;
    } else {
      Alert.closeLoadingIndicator();
      Alert.showError(
        title: AppString.ERROR,
        message: response!.message.toString(),
        buttonText: AppString.CANCEL,
      ).then((value) => Alert.closeLoadingIndicator());
    }
  }
}
