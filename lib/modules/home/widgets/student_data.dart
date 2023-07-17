import 'package:check_in/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StudentName extends StatelessWidget {
  const StudentName({Key? key, required this.studentName}) : super(key: key);
  final String studentName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: 'Name: ',
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: studentName,
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
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
        Text.rich(
          TextSpan(
            text: 'Code: ',
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: code,
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
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
        Text.rich(
          TextSpan(
            text: 'Birthdate: ',
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: studentBirthdate,
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
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
