import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassroomView extends StatelessWidget {
  const ClassroomView({super.key, required this.token});
  final String token;

  Stream<List<Classroom>> getStreamOfData() async* {
    final _connect = GetConnect();
    String url = '${Api.baseUrl}${Api.studentApi.classrooms}';
    final classroomsJson = await _connect.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    // Parse the JSON data into Dart objects
    final List<dynamic> classroomList =
        classroomsJson.body['data']['classrooms'];

    // Convert the JSON objects to Classroom objects
    final List<Classroom> classrooms =
        classroomList.map((json) => Classroom.fromJson(json)).toList();

    // Yield the classrooms list to the stream
    yield classrooms;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<List<Classroom>>(
              stream: getStreamOfData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<Classroom>? classrooms = snapshot.data;
                  return ListView.builder(
                    itemCount: classrooms?.length ?? 0,
                    itemBuilder: (context, index) {
                      final Classroom classroom = classrooms![index];
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(classroom.term.termName),
                          subtitle: Text(classroom.lecturer.fullname),
                          trailing: Text('Credit: ${classroom.term.credit}'),
                        ),
                      );
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
          ),
        ),
      ),
    );
  }
}
