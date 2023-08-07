import 'package:check_in/core/index.dart';
import 'package:check_in/modules/forgot_password/models/forgot_password_model.dart';
import 'package:check_in/modules/forgot_password/provider/forgot_password_provider.dart';

class ForgotPasswordRepository {
  ForgotPasswordRepository({required this.forgotPasswordProvider});

  final ForgotPasswordProvider forgotPasswordProvider;

  Future<BaseResponse?> forgotPassword(
          ForgotPasswordModel forgotPasswordModel, url) =>
      forgotPasswordProvider.forgotPassword(forgotPasswordModel, url);
}
