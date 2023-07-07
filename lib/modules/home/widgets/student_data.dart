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

class StudentPicture extends StatelessWidget {
  const StudentPicture(
      {Key? key, required this.picAddress, required this.onPress})
      : super(key: key);
  final String picAddress;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(picAddress),
      ),
    );
  }
}
