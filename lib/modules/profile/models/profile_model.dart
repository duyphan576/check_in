import '../../../core/base_api_model.dart';

class ProfileModel extends BaseApiModel {
  ProfileModel(
      {act, plus, this.confirmPassword, this.newPassword, this.oldPassword})
      : super(act: act, plus: plus);
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;
  factory ProfileModel.initial() {
    return ProfileModel(
      oldPassword: '',
      newPassword: '',
      confirmPassword: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
      "act": act,
      "plus": plus,
    };
  }
}
