import 'package:check_in/core/base_api_model.dart';

class HomeModel extends BaseApiModel {
  HomeModel({act, plus}) : super(act: act, plus: plus);

  factory HomeModel.initial() {
    return HomeModel(
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
