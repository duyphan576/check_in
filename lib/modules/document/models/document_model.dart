import 'package:check_in/core/base_api_model.dart';

class DocumentModel extends BaseApiModel {
  String? classroomId;

  DocumentModel({this.classroomId, act, plus}) : super(act: act, plus: plus);

  factory DocumentModel.initial() {
    return DocumentModel(
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
