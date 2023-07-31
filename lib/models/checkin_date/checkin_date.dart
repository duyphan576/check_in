class CheckinDate {
  final String date;
  final String type;

  CheckinDate({required this.date, required this.type});

  factory CheckinDate.fromJson(Map<String, dynamic> json) {
    return CheckinDate(
      type: json['type'],
      date: json['checkinTime'],
    );
  }
}
