import 'package:check_in/modules/changePassword/models/change_password_model.dart';

import '../../../core/base_response.dart';
import '../provider/change_password_provider.dart';

class ChangePasswordRepository {
  ChangePasswordRepository({required this.changePasswordProvider});

  final ChangePasswordProvider changePasswordProvider;

  Future<BaseResponse?> changePassword(
          ChangePasswordModel changePasswordModel, url, token) =>
      changePasswordProvider.changePassword(changePasswordModel, url, token);
  Future<BaseResponse?> logout(
          ChangePasswordModel changePasswordModel, url, token) =>
      changePasswordProvider.logout(changePasswordModel, url, token);
}
