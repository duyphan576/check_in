class Lecturer {
  String? code;
  String? fullname;

  Lecturer({this.code, this.fullname});

  factory Lecturer.fromJson(Map<String, dynamic> json) {
    return Lecturer(
      code: json['code'],
      fullname: json['fullname'],
    );
  }
}
