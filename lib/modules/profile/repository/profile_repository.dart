import 'package:check_in/core/base_response.dart';

import '../provider/profile_provider.dart';

class ProfileRepository {
  ProfileRepository({required this.profileProvider});

  final ProfileProvider profileProvider;

  Future<BaseResponse?> profile(Map<String, dynamic> data, url, token) =>
      profileProvider.profile(data, url, token);
}
