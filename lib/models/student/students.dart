class Students {
  int? id;
  int? code;
  String? famMidName;
  String? name;
  String? fullname;
  String? gender;
  String? birthdate;
  int? phone;
  String? email;

  Students({
    this.id,
    this.code,
    this.famMidName,
    this.name,
    this.fullname,
    this.gender,
    this.birthdate,
    this.phone,
    this.email,
  });

  Students.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["id"].toString());
    code = int.parse(json["code"].toString());
    famMidName = json["famMidName"];
    name = json["name"];
    fullname = json["fullname"];
    gender = json["gender"];
    birthdate = json["birthdate"];
    phone = int.parse(json["phone"].toString());
    email = json["email"];
  }
}
