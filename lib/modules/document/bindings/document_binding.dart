import 'package:check_in/modules/document/controllers/document_controller.dart';
import 'package:check_in/modules/document/provider/document_provider.dart';
import 'package:check_in/modules/document/repository/document_repository.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() =>
        DocumentRepository(documentProvider: Get.find<DocumentProvider>()));
    Get.put(DocumentController(
      documentRepository: Get.find<DocumentRepository>(),
    ));
  }
}
