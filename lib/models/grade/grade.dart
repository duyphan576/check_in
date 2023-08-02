class Grade {
  String? termId;
  String? termName;
  String? attendance;
  String? coefficient1Exam1;
  String? coefficient1Exam2;
  String? coefficient1Exam3;
  String? coefficient2Exam1;
  String? coefficient2Exam2;
  String? exam;
  String? finalGrade;

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
    termId = json["termId"].toString();
    termName = json["termName"].toString();
    attendance = json["attendance"].toString();
    coefficient1Exam1 = json["coefficient1Exam1"].toString();
    coefficient1Exam2 = json["coefficient1Exam2"].toString();
    coefficient1Exam3 = json["coefficient1Exam3"].toString();
    coefficient2Exam1 = json["coefficient2Exam1"].toString();
    coefficient2Exam2 = json["coefficient2Exam2"].toString();
    exam = json["exam"].toString();
    finalGrade = json["final"].toString();
  }
}
