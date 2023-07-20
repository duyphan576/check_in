import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';

// class StudentName extends StatelessWidget {
//   const StudentName({Key? key, required this.studentName}) : super(key: key);
//   final String studentName;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       studentName,
//       style: TextStyle(
//         color: AppColors.lightWhite,
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
//
// class StudentCode extends StatelessWidget {
//   const StudentCode({Key? key, required this.code}) : super(key: key);
//   final String code;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       code,
//       style: TextStyle(
//         color: AppColors.lightWhite,
//         fontSize: 16,
//         fontStyle: FontStyle.italic,
//       ),
//     );
//   }
// }

class StudentPicture extends StatelessWidget {
  const StudentPicture({
    Key? key,
    this.name,
    this.code,
    this.height,
    this.width,
    this.onTap,
  }) : super(key: key);
  final String? name;
  final String? code;
  final height;
  final width;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.lightWhite.withOpacity(0.7),
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
                      colors: AppColors.listColorGradientMain,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Text(
                      name != null && name?.isNotEmpty == true
                          ? name!.substring(0, 1)
                          : "",
                      style: TextStyle(
                        color: AppColors.lightWhite,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                  width: width * 0.45,
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
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
