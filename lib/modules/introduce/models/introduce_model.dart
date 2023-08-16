import '../../../core/base_api_model.dart';

class IntroduceModel extends BaseApiModel {
  IntroduceModel({act, plus}) : super(act: act, plus: plus);

  factory IntroduceModel.initial() {
    return IntroduceModel(
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
