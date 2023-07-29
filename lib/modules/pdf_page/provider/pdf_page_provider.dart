import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/pdf_page/models/pdf_page_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class PdfPageProvider extends GetConnect {
  PdfPageProvider({required this.http});

  final HttpProvider http;
}
