import 'package:check_in/core/index.dart';
import 'package:check_in/modules/pdf_page/repository/pdf_page_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class PdfPageController extends GetxController with CacheManager {
  final PdfPageRepository pdfPageRepository;
  late PdfController pdfController;
  GetStorage storage = GetStorage();
  RxBool isLoading = true.obs;
  var url;
  int? pages = 0;
  int currentPage = 0;
  PdfPageController({required this.pdfPageRepository});

  @override
  void onInit() async {
    super.onInit();
    initData();
  }

  initData() async {
    url = await storage.read("url");
    if (url != null) {
      isLoading.value = false;
      pdfController = PdfController(
        document: PdfDocument.openData(
          InternetFile.get(
            url,
          ),
        ),
      );
      pdfController.printInfo();
    }
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }
}
