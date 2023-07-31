class IsChecked {
  final String type;
  final String checkinTime;

  IsChecked({required this.type, required this.checkinTime});

  factory IsChecked.fromJson(Map<String, dynamic> json) {
    return IsChecked(
      type: json['type'].toString(),
      checkinTime: json['checkinTime'].toString(),
    );
  }
}
