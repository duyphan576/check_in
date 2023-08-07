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
        color: AppColors.lightWhite.withOpacity(0.75),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.subMain, // Color of the border
          width: 1.0, // Width of the border
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
                    border: Border.all(
                      color: AppColors.subMain, // Color of the border
                      width: 1.0, // Width of the border
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.subMain,
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
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: width * 0.45,
                  child: Divider(
                    thickness: 1.0,
                    color: AppColors.subMain,
                  ),
                ),
                Text(
                  code ?? "",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
