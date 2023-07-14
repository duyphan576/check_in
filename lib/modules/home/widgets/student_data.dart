import 'package:flutter/material.dart';

class StudentName extends StatelessWidget {
  const StudentName({Key? key, required this.studentName}) : super(key: key);
  final String studentName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hi ', style: Theme.of(context).textTheme.titleMedium),
        Text(studentName, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class StudentCode extends StatelessWidget {
  const StudentCode({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Code: ', style: Theme.of(context).textTheme.titleMedium),
        Text(code, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class StudentBirthdate extends StatelessWidget {
  const StudentBirthdate({Key? key, required this.studentBirthdate})
      : super(key: key);
  final String studentBirthdate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Birthdate: ', style: Theme.of(context).textTheme.titleMedium),
        Text(studentBirthdate, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class StudentPicture extends StatelessWidget {
  const StudentPicture(
      {Key? key, required this.picAddress, required this.onPress})
      : super(key: key);
  final String picAddress;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 4,
      width: MediaQuery.of(context).size.width / 4,
      child: GestureDetector(
        onTap: onPress,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(picAddress),
        ),
      ),
    );
  }
}
