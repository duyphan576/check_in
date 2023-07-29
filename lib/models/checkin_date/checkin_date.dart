class CheckinDate {
  final String date;
  final bool isChecked;

  CheckinDate({required this.date, required this.isChecked});

  factory CheckinDate.fromJson(Map<String, dynamic> json) {
    return CheckinDate(
      date: json['date'],
      isChecked: json['isChecked '],
    );
  }
}
