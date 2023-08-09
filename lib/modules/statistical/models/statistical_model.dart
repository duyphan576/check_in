import 'package:check_in/core/base_api_model.dart';

class StatisticalModel extends BaseApiModel {
  StatisticalModel({
    this.classroomId,
    this.percentages,
    this.name,
    this.nameAmountPercentages,
    this.subName,
    act,
    plus,
  }) : super(act: act, plus: plus);
  String? classroomId;
  String? percentages;
  String? nameAmountPercentages;
  String? name;
  String? subName;
  factory StatisticalModel.initial() {
    return StatisticalModel(
      classroomId: '',
      act: '',
      plus: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "classroomId": classroomId,
      "act": act,
      "plus": plus,
    };
  }

  factory StatisticalModel.fromJson(Map<String, dynamic> json) {
    return StatisticalModel(
      percentages: json["percentages"].toString() ?? "", //giá trị phần %
      nameAmountPercentages:
          json["nameAmountPercentages"] ?? "", //tên hiển thị trên biểu đồ
      name: json["name"] ?? "", //têm loại thống kê
      subName: json["subname"] ?? "", //tên ngắn loại thống kê
    );
  }
}
