import 'package:check_in/core/base_api_model.dart';

class HomeModel extends BaseApiModel {
  HomeModel({required this.code, required this.password, act, plus})
      : super(act: act, plus: plus);

  String code;
  String password;

  factory HomeModel.initial() {
    return HomeModel(
      code: '',
      password: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "code": code,
      "password": password,
      "act": act,
      "plus": plus,
    };
  }
}
