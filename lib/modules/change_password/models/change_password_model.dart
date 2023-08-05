import '../../../core/base_api_model.dart';

class ChangePasswordModel extends BaseApiModel {
  ChangePasswordModel(
      {act, plus, this.confirmPassword, this.newPassword, this.oldPassword})
      : super(act: act, plus: plus);
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;
  factory ChangePasswordModel.initial() {
    return ChangePasswordModel(
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
