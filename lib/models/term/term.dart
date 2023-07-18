class Term {
  final int id;
  final String termName;
  final int credit;

  Term({required this.id, required this.termName, required this.credit});

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      id: json['id'],
      termName: json['termName'],
      credit: json['credit'],
    );
  }
}
