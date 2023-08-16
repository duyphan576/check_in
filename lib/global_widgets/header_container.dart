import 'package:check_in/constants/index.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.text,
    required this.height,
    required this.width,
  });

  final String text;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.subMain,
          fontSize: 16.0,
        ),
        textScaleFactor: 1.0,
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}

class SubHeaderHS1 extends StatelessWidget {
  const SubHeaderHS1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 80,
      child: Column(
        children: [
          Container(
            child: Text(
              GradeString.COEFFICIENT_1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.subMain,
                fontSize: 14.0,
              ),
              textScaleFactor: 1.0,
            ),
            width: 150,
            height: 40,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey.shade200,
                ),
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: HeaderContainer(
                  text: GradeString.ONE,
                  width: 50,
                  height: 40,
                ),
              ),
              Expanded(
                child: HeaderContainer(
                  text: GradeString.TWO,
                  width: 50,
                  height: 40,
                ),
              ),
              Expanded(
                child: HeaderContainer(
                  text: GradeString.THREE,
                  width: 50,
                  height: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SubHeaderHS2 extends StatelessWidget {
  const SubHeaderHS2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      child: Column(
        children: [
          Container(
            child: Text(
              GradeString.COEFFICIENT_2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.subMain,
                fontSize: 14.0,
              ),
              textScaleFactor: 1.0,
            ),
            width: 100,
            height: 40,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey.shade200,
                ),
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: HeaderContainer(
                  text: GradeString.ONE,
                  width: 50,
                  height: 40,
                ),
              ),
              Expanded(
                child: HeaderContainer(
                  text: GradeString.TWO,
                  width: 50,
                  height: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}