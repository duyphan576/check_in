class GradeStudent {
  final int termId;
  final String termName;
  final int mark;

  GradeStudent(
      {required this.termId, required this.termName, required this.mark});

  factory GradeStudent.fromJson(Map<String, dynamic> json) {
    return GradeStudent(
      termId: json["termId"],
      termName: json["termName"],
      mark: json["mark"],
    );
  }
}
