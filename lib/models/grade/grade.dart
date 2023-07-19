class Grade {
  int? termId;
  String? termName;
  int? mark;

  Grade({this.termId, this.termName, this.mark});

  Grade.fromJson(Map<String, dynamic> json) {
    termId = int.parse(json["termId"].toString());
    termName = json["termName"].toString();
    mark = int.parse(json["mark"].toString());
  }
}
