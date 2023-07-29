import 'package:check_in/modules/profile/models/profile_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class ProfileProvider extends GetConnect {
  ProfileProvider({required this.http});

  final HttpProvider http;
}
