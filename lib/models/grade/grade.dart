class GradeStudent {
  int? termID;
  String? termName;
  double? mark;

  GradeStudent({this.termID, this.termName, this.mark});

  factory GradeStudent.fromJson(Map<String, dynamic> json) {
    return GradeStudent(
      termID: json["termID"],
      termName: json["termName"],
      mark: json["mark"],
    );
  }
}
