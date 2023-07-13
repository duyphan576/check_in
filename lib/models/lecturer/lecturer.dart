class Lecturer {
  final String code;
  final String fullname;

  Lecturer({required this.code, required this.fullname});

  factory Lecturer.fromJson(Map<String, dynamic> json) {
    return Lecturer(
      code: json['code'],
      fullname: json['fullname'],
    );
  }
}
