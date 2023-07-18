import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class ProfileProvider extends GetConnect {
  ProfileProvider({required this.http});

  final HttpProvider http;
}
