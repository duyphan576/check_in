class Statistical {
  int? termId;
  String? termName;
  int? grade;

  Statistical({this.termId, this.termName, this.grade});

  Statistical.fromJson(Map<String, dynamic> json) {
    termId = int.parse(json["termId"].toString());
    termName = json["termName"].toString();
    grade = int.parse(json["grade"].toString());
  }
}
