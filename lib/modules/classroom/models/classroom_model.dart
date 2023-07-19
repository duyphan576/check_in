import 'package:check_in/core/base_api_model.dart';

class ClassroomModel extends BaseApiModel {
  ClassroomModel({act, plus}) : super(act: act, plus: plus);

  factory ClassroomModel.initial() {
    return ClassroomModel(
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
