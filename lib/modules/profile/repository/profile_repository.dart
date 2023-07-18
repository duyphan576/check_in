import '../../../core/base_response.dart';
import '../models/profile_model.dart';
import '../provider/profile_provider.dart';

class ProfileRepository {
  ProfileRepository({required this.profileProvider});

  final ProfileProvider profileProvider;
}
