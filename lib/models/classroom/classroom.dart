import 'package:check_in/models/lecturer/lecturer.dart';
import 'package:check_in/models/term/term.dart';

class Classroom {
  int? id;
  Lecturer? lecturer;
  Term? term;

  Classroom({this.id, this.lecturer, this.term});

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['id'],
      lecturer: Lecturer.fromJson(json['lecturer']),
      term: Term.fromJson(json['term']),
    );
  }
}
