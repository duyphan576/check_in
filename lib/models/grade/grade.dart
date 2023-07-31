import 'dart:ffi';

class Grade {
  int? termId;
  String? termName;
  double? attendanceGrade;
  double? examGrade;
  double? finalGrade;

  Grade(
      {this.termId,
      this.termName,
      this.attendanceGrade,
      this.examGrade,
      this.finalGrade});

  Grade.fromJson(Map<String, dynamic> json) {
    termId = int.parse(json["termId"].toString());
    termName = json["termName"].toString();
    attendanceGrade = double.parse(json["attendanceGrade"].toString());
    examGrade = double.parse(json["examGrade"].toString());
    finalGrade = double.parse(json["finalGrade"].toString());
  }
}
