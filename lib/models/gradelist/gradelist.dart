import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/models/student/students.dart';

class Gradelist {
  final String grade;
  final Classroom classroom;
  final List<Students> studentList;

  Gradelist({
    required this.grade,
    required this.classroom,
    required this.studentList,
  });

  factory Gradelist.fromJson(Map<String, dynamic> json) {
    return Gradelist(
        grade: json['grade'],
        classroom: Classroom.fromJson(json['classroom']),
        studentList: List.from(json['studentList'])
            .map(
              (studentData) => Students.fromJson(studentData),
            )
            .toList());
  }
}
