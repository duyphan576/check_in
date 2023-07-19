import 'package:check_in/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StudentName extends StatelessWidget {
  const StudentName({Key? key, required this.studentName}) : super(key: key);
  final String studentName;
  @override
  Widget build(BuildContext context) {
    return Text(
      studentName,
      style: TextStyle(
        color: AppColors.lightWhite,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class StudentCode extends StatelessWidget {
  const StudentCode({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    return Text(
      code,
      style: TextStyle(
        color: AppColors.lightWhite,
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class StudentPicture extends StatelessWidget {
  const StudentPicture({Key? key, required this.picAddress}) : super(key: key);
  final String picAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 4,
      width: MediaQuery.of(context).size.width / 4,
      child: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(picAddress),
        ),
      ),
    );
  }
}
