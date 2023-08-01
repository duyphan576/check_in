import 'dart:ffi';

class Grade {
  int? termId;
  String? termName;
  double? attendance;
  double? coefficient1Exam1;
  double? coefficient1Exam2;
  double? coefficient1Exam3;
  double? coefficient2Exam1;
  double? coefficient2Exam2;
  double? exam;
  double? finalGrade;

  Grade(
      {this.termId,
      this.termName,
      this.attendance,
      this.coefficient1Exam1,
      this.coefficient1Exam2,
      this.coefficient1Exam3,
      this.coefficient2Exam1,
      this.coefficient2Exam2,
      this.exam,
      this.finalGrade});

  Grade.fromJson(Map<String, dynamic> json) {
    termId = int.parse(json["termId"].toString());
    termName = json["termName"].toString();
    attendance = double.parse(json["attendance"].toString());
    coefficient1Exam1 = double.parse(json["coefficient1Exam1"].toString());
    coefficient1Exam2 = double.parse(json["coefficient1Exam2"].toString());
    coefficient1Exam3 = double.parse(json["coefficient1Exam3"].toString());
    coefficient2Exam1 = double.parse(json["coefficient2Exam1"].toString());
    coefficient2Exam2 = double.parse(json["coefficient2Exam2"].toString());
    exam = double.parse(json["exam"].toString());
    finalGrade = double.parse(json["final"].toString());
  }
}
