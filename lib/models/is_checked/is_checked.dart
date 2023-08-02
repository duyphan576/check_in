class IsChecked {
  String? type;
  String? checkinTime;

  IsChecked({this.type, this.checkinTime});

  factory IsChecked.fromJson(Map<String, dynamic> json) {
    return IsChecked(
      type: json['type'].toString(),
      checkinTime: json['checkinTime'].toString(),
    );
  }
}
