import 'package:check_in/core/cache_manager.dart';
import 'package:check_in/models/document/document.dart';
import 'package:check_in/modules/document/models/document_model.dart';
import 'package:check_in/modules/document/repository/document_repository.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:check_in/services/authenticationService.dart';
import 'package:check_in/services/domain_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class DocumentController extends GetxController with CacheManager {
  final DocumentRepository documentRepository;
  final AuthenticationService authenticationService = AuthenticationService();
  var userData;
  RxBool isLoading = true.obs;
  RxList<Document> documents = <Document>[].obs;
  DocumentController({required this.documentRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
    getDocuments("1");
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  getDocuments(String classroomId) async {
    print(classroomId);
    final response = await documentRepository.postGradeList(
      classroomId,
      UrlProvider.HANDLES_DOCUMENT,
      cacheGet(CacheManagerKey.TOKEN),
    );
    print(response?.data["documents"]);
    if (response?.statusCode == HttpStatus.ok) {
      if (response?.status == 1) {
        List<dynamic> documentList = response!.data['documents'];
        List<Document> documentsData =
            documentList.map((json) => Document.fromJson(json)).toList();
        documents.assignAll(documentsData);
        update();
      }
    }
  }
}
