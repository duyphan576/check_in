import 'package:check_in/models/checkin_history/checkin_history.dart';

class ListHistory {
  final List<CheckinHistory> list;

  ListHistory({required this.list});

  factory ListHistory.fromJson(Map<String, dynamic> json) {
    return ListHistory(
      list: List.from(json["checkedInList"])
          .map(
            (listData) => CheckinHistory.fromJson(listData),
          )
          .toList(),
    );
  }
}
