import 'package:check_in/modules/login/models/login_model.dart';
import 'package:check_in/modules/login/provider/login_provider.dart';

import '../../../core/base_response.dart';

class LoginRepository {
  LoginRepository({required this.loginProvider});

  final LoginProvider loginProvider;

  Future<BaseResponse?> login(LoginModel loginModel, url) =>
      loginProvider.login(loginModel, url);
}
