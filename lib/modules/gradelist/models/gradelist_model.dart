import 'package:check_in/core/base_api_model.dart';

class GradelistModel extends BaseApiModel {
  GradelistModel({act, plus}) : super(act: act, plus: plus);

  factory GradelistModel.initial() {
    return GradelistModel(
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
