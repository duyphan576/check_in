import 'package:check_in/core/index.dart';
import 'package:check_in/modules/active_user/models/active_user_model.dart';
import 'package:check_in/modules/active_user/provider/active_user_provider.dart';

class ActiveUserRepository {
  ActiveUserRepository({required this.activeUserProvider});

  final ActiveUserProvider activeUserProvider;

  Future<BaseResponse?> activeUser(ActiveUserModel activeUserModel, url) =>
      activeUserProvider.activeUser(activeUserModel, url);
}
