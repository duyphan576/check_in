class GradeDetailModel {
  String? idTerm;
  String? nameTerm;
  String? attendance;
  String? coefficient1Exam1;
  String? coefficient1Exam2;
  String? coefficient1Exam3;
  String? coefficient2Exam1;
  String? coefficient2Exam2;
  String? exam;
  String? finalGrade;
  String? gpa10;
  String? gpa4;
  String? gbaCH;
  String? result;

  GradeDetailModel({
    this.idTerm,
    this.nameTerm,
    this.attendance,
    this.coefficient1Exam1,
    this.coefficient1Exam2,
    this.coefficient1Exam3,
    this.coefficient2Exam1,
    this.coefficient2Exam2,
    this.exam,
    this.finalGrade,
    this.gpa10,
    this.gpa4,
    this.gbaCH,
    this.result,
  });

  factory GradeDetailModel.fromJson(Map<String, dynamic> json) {
    return GradeDetailModel(
      idTerm: json["termId"].toString(),
      nameTerm: json["termName"].toString(),
      attendance: json["attendance"].toString(),
      coefficient1Exam1: json["coefficient1Exam1"].toString(),
      coefficient1Exam2: json["coefficient1Exam2"].toString(),
      coefficient1Exam3: json["coefficient1Exam3"].toString(),
      coefficient2Exam1: json["coefficient2Exam1"].toString(),
      coefficient2Exam2: json["coefficient2Exam2"].toString(),
      exam: json["exam"].toString(),
      finalGrade: json["final"].toString(),
      gpa10: json["gpa10"].toString(),
      gpa4: json["gpa4"].toString(),
      gbaCH: json["gbaCH"].toString(),
      result: json["result"].toString(),
    );
  }
}
