import 'package:flutter/material.dart';
import 'package:check_in/utils/api.dart';
import 'package:check_in/models/student/students.dart';
import 'package:get_storage/get_storage.dart';
import 'package:check_in/models/grade/grade.dart';
import 'dart:convert';
import 'package:get/get.dart';

class StudentGradeView extends StatelessWidget {
  StudentGradeView({Key? key, required this.students, required this.token})
      : super(key: key);

  final Students students;
  final String token;

  // List<GradeStudent> parseMarkList(String jsonString) {
  //   final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
  //   return parsed
  //       .map<GradeStudent>((json) => GradeStudent.fromJson(json))
  //       .toList();
  // }
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final _connect = GetConnect();
    Stream<List<GradeStudent>> getStreamOfData() async* {
      final _connect = GetConnect();
      String url = '${Api.baseUrl}${Api.gradeApi.gradeStudent}';
      final gradesJson = await _connect.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      print(gradesJson.body["marks"]);
      final List<dynamic> gradesList = gradesJson.body['marks'];

      // Convert the JSON objects to Classroom objects
      final List<GradeStudent> grades =
          gradesList.map((json) => GradeStudent.fromJson(json)).toList();

      // Yield the classrooms list to the stream
      yield grades;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Column(
          children: [
            Text(students.fullname.toString()),
            Text(
              "${students.code} | ${students.birthdate}",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ContainerListTile();
        },
      ),
    );
  }
}

class ContainerListTile extends StatelessWidget {
  const ContainerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Colors.lightBlue.shade600, Colors.lightBlue.shade300],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Module Name: xxxxxx",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              "Marks: 10",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Id : 1",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
