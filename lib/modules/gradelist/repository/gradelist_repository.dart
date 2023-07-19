import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/gradelist/models/gradelist_model.dart';
import 'package:check_in/modules/gradelist/provider/gradelist_provider.dart';

class GradelistRepository {
  GradelistRepository({required this.gradelistProvider});

  final GradelistProvider gradelistProvider;

  Future<BaseResponse?> gradelist(GradelistModel gradelistModel, url, token) =>
      gradelistProvider.gradelist(gradelistModel, url, token);
}
