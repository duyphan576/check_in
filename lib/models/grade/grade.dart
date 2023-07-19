class Grade {
  int? termId;
  String? termName;
  int? grade;

  Grade({this.termId, this.termName, this.grade});

  Grade.fromJson(Map<String, dynamic> json) {
    termId = int.parse(json["termId"].toString());
    termName = json["termName"].toString();
    grade = int.parse(json["grade"].toString());
  }
}
