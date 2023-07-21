import 'package:check_in/core/base_api_model.dart';

class DetailModel extends BaseApiModel {
  DetailModel({act, plus}) : super(act: act, plus: plus);

  factory DetailModel.initial() {
    return DetailModel(
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
