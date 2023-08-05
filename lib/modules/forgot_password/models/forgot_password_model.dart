import 'package:check_in/core/base_api_model.dart';

class ForgotPasswordModel extends BaseApiModel {
  ForgotPasswordModel({required this.code, required this.email, act, plus})
      : super(act: act, plus: plus);

  String code;
  String email;

  factory ForgotPasswordModel.initial() {
    return ForgotPasswordModel(
      code: '',
      email: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "code": code,
      "email": email,
      "act": act,
      "plus": plus,
    };
  }
}
