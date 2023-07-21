import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/models/documents/documents.dart';
import 'package:check_in/models/student/students.dart';

class Detail {
  final String grade;
  final Classroom classroom;
  final List<Students> studentList;
  final List<Documents> documentList;

  Detail({
    required this.grade,
    required this.classroom,
    required this.studentList,
    required this.documentList,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      grade: json['grade'].toString(),
      classroom: Classroom.fromJson(json['classroom']),
      studentList: List.from(json['studentList'])
          .map(
            (studentData) => Students.fromJson(studentData),
          )
          .toList(),
      documentList: List.from(json["documents"])
          .map(
            (documentData) => Documents.fromJson(documentData),
          )
          .toList(),
    );
  }
}
