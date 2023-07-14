import '../../../core/base_response.dart';
import '../models/profile_model.dart';
import '../provider/profile_provider.dart';

class ProfileRepository {
  ProfileRepository({required this.profileProvider});

  final ProfileProvider profileProvider;

  Future<BaseResponse?> getConfig(ProfileModel profileModel) =>
      profileProvider.getConfig(profileModel);

  Future<BaseResponse?> getLang(ProfileModel profileModel) =>
      profileProvider.getLang(profileModel);

  Future<BaseResponse?> getInforUser(ProfileModel profileModel) =>
      profileProvider.getInfoUser(profileModel);
}
