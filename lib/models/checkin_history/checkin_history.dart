import 'package:check_in/models/checkin_date/checkin_date.dart';
import 'package:check_in/models/classroom/classroom.dart';

class CheckinHistory {
  List<CheckinDate>? checkinDate;
  Classroom? classroom;

  CheckinHistory({this.checkinDate, this.classroom});

  factory CheckinHistory.fromJson(Map<String, dynamic> json) {
    return CheckinHistory(
      checkinDate: List.from(json['checkinDate'])
          .map(
            (checkinData) => CheckinDate.fromJson(checkinData),
          )
          .toList(),
      classroom: Classroom.fromJson(json['classroom']),
    );
  }
}
