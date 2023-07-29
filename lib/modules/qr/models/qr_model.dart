import '../../../core/base_api_model.dart';

class QrModel extends BaseApiModel {
  QrModel({act, plus}) : super(act: act, plus: plus);

  factory QrModel.initial() {
    return QrModel(
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
