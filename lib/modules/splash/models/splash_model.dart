import '../../../core/base_api_model.dart';

class SplashModel extends BaseApiModel {
  SplashModel({required this.lang, this.userId, this.token, act, plus})
      : super(act: act, plus: plus);

  String lang;
  String? userId;
  String? token;

  factory SplashModel.initial() {
    return SplashModel(
      lang: '',
      userId: '',
      act: '',
      plus: '',
      token: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "lang": lang,
      "userId": userId,
      "act": act,
      "plus": plus,
      "token": token,
    };
  }
}
