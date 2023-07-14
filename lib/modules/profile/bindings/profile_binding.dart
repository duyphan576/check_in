import 'package:check_in/modules/profile/controllers/profile_controller.dart';
import 'package:check_in/modules/profile/provider/profile_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../repository/profile_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(
        () => ProfileRepository(profileProvider: Get.find<ProfileProvider>()));

    Get.put(ProfileController(
      profileRepository: Get.find<ProfileRepository>(),
    ));
  }
}
