import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.lightWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          GlobalStyles.sizedBoxHeight_10,
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.lightWhite,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          Divider(
            thickness: 1.0,
            color: AppColors.lightWhite,
          ),
        ],
      ),
    );
  }
}
