import 'package:check_in/modules/changePassword/models/change_password_model.dart';

import '../../../core/base_response.dart';
import '../provider/change_password_provider.dart';

class ChangePasswordRepository {
  ChangePasswordRepository({required this.changePasswordProvider});

  final ChangePasswordProvider changePasswordProvider;

  Future<BaseResponse?> changePassord(
          ChangePasswordModel changePasswordModel, url, token) =>
      changePasswordProvider.changePassord(changePasswordModel, url, token);
}
