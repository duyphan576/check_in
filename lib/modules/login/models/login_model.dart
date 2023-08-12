import 'package:check_in/core/base_api_model.dart';

class LoginModel extends BaseApiModel {
  LoginModel(
      {required this.code,
      required this.password,
      required this.notifyToken,
      act,
      plus})
      : super(act: act, plus: plus);

  String code;
  String password;
  String notifyToken;

  factory LoginModel.initial() {
    return LoginModel(
      code: '',
      password: '',
      notifyToken: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "code": code,
      "password": password,
      "notifyToken": notifyToken,
      "act": act,
      "plus": plus,
    };
  }
}
