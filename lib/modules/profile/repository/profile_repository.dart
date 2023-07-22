import 'package:check_in/modules/profile/models/profile_model.dart';

import '../../../core/base_response.dart';
import '../provider/profile_provider.dart';

class ProfileRepository {
  ProfileRepository({required this.profileProvider});

  final ProfileProvider profileProvider;

  Future<BaseResponse?> changePassord(ProfileModel profileModel, url, token) =>
      profileProvider.changePassord(profileModel, url, token);
}
