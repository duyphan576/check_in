import 'package:check_in/models/is_checked/is_checked.dart';

class CheckinDate {
  final String date;
  final String time;
  final IsChecked isChecked;

  CheckinDate(
      {required this.date, required this.time, required this.isChecked});

  factory CheckinDate.fromJson(Map<String, dynamic> json) {
    return CheckinDate(
      date: json['date'],
      time: json['time'].toString(),
      isChecked: IsChecked.fromJson(
        json['isChecked'],
      ),
    );
  }
}
