import '../../../core/base_api_model.dart';

class ProfileModel extends BaseApiModel {
  ProfileModel({act, plus}) : super(act: act, plus: plus);

  factory ProfileModel.initial() {
    return ProfileModel(
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
