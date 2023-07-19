import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/classroom/models/classroom_model.dart';
import 'package:check_in/modules/classroom/provider/classroom_provider.dart';

class ClassroomRepository {
  ClassroomRepository({required this.classroomProvider});

  final ClassroomProvider classroomProvider;

  Future<BaseResponse?> classroom(ClassroomModel classroomModel, url, token) =>
      classroomProvider.classroom(classroomModel, url, token);
}
