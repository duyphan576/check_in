class User {
  int? status;
  String? access_token;
  String? token_type;
  int? expires_in;

  User({this.status, this.access_token, this.token_type, this.expires_in});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    access_token = json['access_token'];
    token_type = json['token_type'];
    expires_in = json['expires_in'];
  }
}
