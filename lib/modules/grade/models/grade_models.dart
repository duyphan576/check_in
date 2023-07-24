import '../../../core/base_api_model.dart';

class GradeModel extends BaseApiModel {
  GradeModel({act, plus}) : super(act: act, plus: plus);

  factory GradeModel.initial() {
    return GradeModel(
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
