import 'package:check_in/models/grade/grade_detail_model.dart';

import '../../../core/base_api_model.dart';

class GradeModel extends BaseApiModel {
  GradeModel({
    this.idSemester,
    this.nameSemester,
    this.semesterGPA4,
    this.semesterGPA10,
    this.cumulativeGPA4,
    this.cumulativeGPA10,
    this.listGradeDetail,
    this.courseCreditsAchieve,
    this.courseCreditsAll,
    act,
    plus,
  }) : super(act: act, plus: plus);
  String? idSemester;
  String? nameSemester;
  String? semesterGPA10;
  String? semesterGPA4;
  String? cumulativeGPA10;
  String? cumulativeGPA4;
  String? courseCreditsAchieve;
  String? courseCreditsAll;

  List<GradeDetailModel>? listGradeDetail;

  factory GradeModel.initial() {
    return GradeModel(
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

  factory GradeModel.fromJson(Map<String, dynamic> json) {
    List<GradeDetailModel> listGradeDetail = [];
    if (json['list_grade'] != null) {
      json['list_grade'].forEach((item) {
        listGradeDetail.add(GradeDetailModel.fromJson(item));
      });
    }

    return GradeModel(
      idSemester: json["idSemester"].toString() ?? "", //id Học kỳ
      nameSemester: json["nameSemester"] ?? "", //tên học kỳ
      semesterGPA10: json["semesterGPA10"] ?? "", //ĐTB học kỳ hệ 10
      semesterGPA4: json["semesterGPA4"] ?? "", //ĐTB học kỳ hệ 4
      cumulativeGPA10: json["cumulativeGPA10"] ?? "", //ĐTB tích luỹ hệ 10
      cumulativeGPA4: json["cumulativeGPA4"] ?? "", //ĐTB tích luỹ hệ 4
      courseCreditsAchieve:
          json["courseCreditsAchieve"] ?? "", //Tín chỉ đạt được
      courseCreditsAll: json["courseCreditsAll"] ?? "", //Tín chỉ tích lũy
      listGradeDetail: listGradeDetail, //Danh sách điểm học phần
    );
  }
}
