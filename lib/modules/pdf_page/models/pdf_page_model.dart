import 'package:check_in/core/base_api_model.dart';

class PdfPageModel extends BaseApiModel {
  PdfPageModel(
      {act, plus, this.confirmPassword, this.newPassword, this.oldPassword})
      : super(act: act, plus: plus);
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;
  factory PdfPageModel.initial() {
    return PdfPageModel(
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "act": act,
      "plus": plus,
    };
  }
}
