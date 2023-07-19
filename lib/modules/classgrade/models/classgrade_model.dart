import 'package:check_in/core/base_api_model.dart';

class ClassgradeModel extends BaseApiModel {
  ClassgradeModel({act, plus}) : super(act: act, plus: plus);

  factory ClassgradeModel.initial() {
    return ClassgradeModel(
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
