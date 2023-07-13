import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class AppProvider extends GetConnect {
  AppProvider(this.http);

  final HttpProvider http;
}
