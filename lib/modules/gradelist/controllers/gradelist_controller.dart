import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/modules/gradelist/repository/gradelist_repository.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:get/get.dart';

class GradelistController extends GetxController with CacheManager {
  final GradelistRepository gradelistRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var classData;
  RxBool isLoading = true.obs;

  GradelistController({required this.gradelistRepository});

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
    }
  }

  // Stream<List<Gradelist>> getStreamOfData() async* {
  //   final response = await gradelistRepository.gradelist(GradelistModel(),
  //       UrlProvider.HANDLES_CLASSROOM, cacheGet(CacheManagerKey.TOKEN));
  //   // Parse the JSON data into Dart objects
  //   final List<dynamic> gradelistList = response?.data['gradelists'];
  //   // Convert the JSON objects to Gradelist objects
  //   final List<Gradelist> gradelists =
  //       gradelistList.map((json) => Gradelist.fromJson(json)).toList();

  //   // Yield the gradelists list to the stream
  //   yield gradelists;
  // }
}
