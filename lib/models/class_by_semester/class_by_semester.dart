import 'package:check_in/models/classroom/classroom.dart';

class ClassBySemester {
  String? idSemester;
  String? nameSemester;
  List<Classroom>? classroomList;

  ClassBySemester({this.idSemester, this.nameSemester, this.classroomList});

  factory ClassBySemester.fromJson(Map<String, dynamic> json) {
    return ClassBySemester(
      idSemester: json['idSemester'].toString(),
      nameSemester: json['nameSemester'],
      classroomList: List.from(json['list_classroom'])
          .map(
            (classroomData) => Classroom.fromJson(classroomData),
          )
          .toList(),
    );
  }
}
