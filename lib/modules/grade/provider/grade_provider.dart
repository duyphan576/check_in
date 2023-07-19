import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class GradeProvider extends GetConnect {
  GradeProvider({required this.http});

  final HttpProvider http;
}
