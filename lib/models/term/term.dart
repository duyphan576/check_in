class Term {
  int? id;
  String? termName;
  int? credit;

  Term({this.id, this.termName, this.credit});

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      id: json['id'],
      termName: json['termName'],
      credit: json['credit'],
    );
  }
}
