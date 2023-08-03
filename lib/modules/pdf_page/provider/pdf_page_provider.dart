import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class PdfPageProvider extends GetConnect {
  PdfPageProvider({required this.http});

  final HttpProvider http;
}
