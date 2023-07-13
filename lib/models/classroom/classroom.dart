import 'package:check_in/models/lecturer/lecturer.dart';
import 'package:check_in/models/term/term.dart';

class Classroom {
  final int id;
  final Lecturer lecturer;
  final Term term;

  Classroom({required this.id, required this.lecturer, required this.term});

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['id'],
      lecturer: Lecturer.fromJson(json['lecturer']),
      term: Term.fromJson(json['term']),
    );
  }
}
