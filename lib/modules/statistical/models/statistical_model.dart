import 'package:check_in/core/base_api_model.dart';

class StatisticalModel extends BaseApiModel {
  StatisticalModel({act, plus}) : super(act: act, plus: plus);

  factory StatisticalModel.initial() {
    return StatisticalModel(
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
