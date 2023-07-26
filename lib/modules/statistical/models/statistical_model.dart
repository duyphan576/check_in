import 'package:check_in/core/base_api_model.dart';

class StatisticalModel extends BaseApiModel {
  StatisticalModel({required this.classroomId, act, plus})
      : super(act: act, plus: plus);
  String classroomId;
  factory StatisticalModel.initial() {
    return StatisticalModel(
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
