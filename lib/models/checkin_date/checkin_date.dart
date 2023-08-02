import 'package:check_in/models/is_checked/is_checked.dart';

class CheckinDate {
  String? date;
  String? time;
  IsChecked? isChecked;

  CheckinDate({this.date, this.time, this.isChecked});

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
