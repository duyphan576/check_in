import 'package:flutter/material.dart';
import 'package:check_in/utils/api.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/models/grade/grade.dart';
import 'package:get/get.dart';

class StudentGradeView extends StatelessWidget {
  StudentGradeView({Key? key, required this.students, required this.token})
      : super(key: key);
  final Students students;
  final String token;

  Stream<List<GradeStudent>> getStreamOfData() async* {
    final _connect = GetConnect();
    String url = '${Api.baseUrl}${Api.gradeApi.gradestu}';
    final gradesJson = await _connect.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final List<dynamic> gradesList = gradesJson.body['marks'];
    print(gradesJson.body);

    // Convert the JSON objects to Classroom objects
    final List<GradeStudent> grades =
        gradesList.map((json) => GradeStudent.fromJson(json)).toList();

    // Yield the classrooms list to the stream
    yield grades;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Column(
          children: [
            Text(students.fullname.toString()),
            Text(
              "${students.code} | ${students.birthdate}",
              style: TextStyle(color: Colors.grey.shade300, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<List<GradeStudent>>(
        stream: getStreamOfData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<GradeStudent>? grades = snapshot.data;
            return ListView.builder(
              itemCount: grades?.length ?? 0,
              itemBuilder: (context, index) {
                final GradeStudent grade = grades![index];
                return ContainerListTile(gradeStudent: grade);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }
}

class ContainerListTile extends StatelessWidget {
  const ContainerListTile({Key? key, required this.gradeStudent})
      : super(key: key);
  final GradeStudent gradeStudent;
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
              "Term Name : ${gradeStudent.termName.toString()}",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mark : ${gradeStudent.mark.toString()}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        trailing: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "Id : ${gradeStudent.termId.toString()}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
