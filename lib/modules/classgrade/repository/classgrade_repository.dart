import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/classgrade/models/classgrade_model.dart';
import 'package:check_in/modules/classgrade/provider/classgrade_provider.dart';

class ClassgradeRepository {
  ClassgradeRepository({required this.classgradeProvider});

  final ClassgradeProvider classgradeProvider;

  Future<BaseResponse?> classgrade(
          ClassgradeModel classgradeModel, url, token) =>
      classgradeProvider.classgrade(classgradeModel, url, token);
}
