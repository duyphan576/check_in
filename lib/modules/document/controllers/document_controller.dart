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
    getDocumentOfData();
  }

  initData() async {
    userData = await cacheGet(CacheManagerKey.CUSTOMER_INFO);
    if (userData != null) {
      isLoading.value = false;
    }
  }

  Future<void> getDocumentOfData() async {
    final response = await documentRepository.document(
      DocumentModel(),
      UrlProvider.HANDLES_DOCUMENT,
      cacheGet(CacheManagerKey.TOKEN),
    );
    if (response != null &&
        response.data != null &&
        response.data.containsKey('documents')) {
      List<dynamic> documentList = response.data['documents'];
      List<Document> documentsData =
          documentList.map((json) => Document.fromJson(json)).toList();
      documents.assignAll(documentsData);
    } else {
      // Xử lý trường hợp khi response là null hoặc không chứa khóa 'documents'
      // Bạn có thể hiển thị thông báo lỗi hoặc thực hiện bất kỳ hành động phù hợp nào ở đây
      print('Lỗi: Không thể lấy dữ liệu tài liệu.');
    }

    update();
  }
}
