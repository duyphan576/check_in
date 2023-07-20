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
  const StudentPicture({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 4,
      width: MediaQuery.of(context).size.width / 4,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightWhite.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: AppColors.black,
                blurRadius: 4,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Color(0xFF41D8D7),
                Color(0xFF21A3C6),
                Color(0xFF285DA2),
                Color(0xFF332F61),
                Color(0xFF452E51),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              name.substring(0, 1),
              style: TextStyle(
                color: AppColors.lightWhite,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
