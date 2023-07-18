import '../../../core/base_api_model.dart';

class SplashModel extends BaseApiModel {
  SplashModel({act, plus}) : super(act: act, plus: plus);

  factory SplashModel.initial() {
    return SplashModel(
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
