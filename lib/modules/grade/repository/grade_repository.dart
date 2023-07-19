import '../../../core/base_response.dart';
import '../models/grade_models.dart';
import '../provider/grade_provider.dart';

class GradeRepository {
  GradeRepository({required this.gradeProvider});

  final GradeProvider gradeProvider;
}
