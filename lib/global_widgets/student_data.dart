import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';

class StudentPicture extends StatelessWidget {
  const StudentPicture({
    Key? key,
    this.name,
    this.code,
    this.height,
    this.width,
    this.grade,
    this.onTap,
  }) : super(key: key);
  final String? name;
  final String? code;
  final height;
  final width;
  final String? grade;
  final onTap;

  @override
  Widget build(BuildContext context) {
    bool isGrade = grade == null;
    return Container(
      height: height * 0.15,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.lightWhite.withOpacity(0.75),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.black,
            blurRadius: 4,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
        gradient: LinearGradient(
          colors: AppColors.listColorGradientMain,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: GlobalStyles.paddingPageLeftRight_25,
        child: Row(
          children: [
            Container(
              height: width / 4,
              width: width / 4,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightWhite,
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Text(
                      name != null && name?.isNotEmpty == true
                          ? name!.substring(0, 1)
                          : "",
                      style: TextStyle(
                        color: AppColors.lightBlack,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GlobalStyles.sizedBoxWidth,
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? "",
                  style: TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: width * 0.4,
                  child: Divider(
                    thickness: 1.0,
                    color: AppColors.lightWhite,
                  ),
                ),
                Text(
                  code ?? "",
                  style: TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                isGrade
                    ? GlobalStyles.sizedBoxHeight_25
                    : Column(
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: Divider(
                              thickness: 1.0,
                              color: AppColors.lightWhite,
                            ),
                          ),
                          Text(
                            "Average Grade : $grade",
                            style: TextStyle(
                              color: AppColors.lightWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          GlobalStyles.sizedBoxHeight_10
                        ],
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
