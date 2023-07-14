import '../../../core/base_api_model.dart';

class ProfileModel extends BaseApiModel {
  ProfileModel({required this.lang, this.userId, this.token, act, plus})
      : super(act: act, plus: plus);

  String lang;
  String? userId;
  String? token;

  factory ProfileModel.initial() {
    return ProfileModel(
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
