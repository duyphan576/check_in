import 'package:check_in/modules/pdf_page/controllers/pdf_page_controller.dart';
import 'package:check_in/modules/pdf_page/provider/pdf_page_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../repository/pdf_page_repository.dart';

class PdfPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PdfPageProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(
        () => PdfPageRepository(pdfPageProvider: Get.find<PdfPageProvider>()));

    Get.put(PdfPageController(
      pdfPageRepository: Get.find<PdfPageRepository>(),
    ));
  }
}
