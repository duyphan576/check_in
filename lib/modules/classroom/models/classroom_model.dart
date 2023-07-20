import 'package:check_in/core/base_api_model.dart';

class ClassroomModel extends BaseApiModel {
  ClassroomModel({classroomId, act, plus}) : super(act: act, plus: plus);
  String? classroomId;
  factory ClassroomModel.initial() {
    return ClassroomModel(
      classroomId: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "classroomId": classroomId,
      "act": act,
      "plus": plus,
    };
  }
}
