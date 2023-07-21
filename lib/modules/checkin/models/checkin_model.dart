import 'package:check_in/core/base_api_model.dart';

class CheckinModel extends BaseApiModel {
  CheckinModel({act, plus}) : super(act: act, plus: plus);

  factory CheckinModel.initial() {
    return CheckinModel(
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
