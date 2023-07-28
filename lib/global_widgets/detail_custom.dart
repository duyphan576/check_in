import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/statistical/statistical.dart';
import 'package:check_in/modules/statistical/view/statistical_view.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailCustom extends StatelessWidget {
  DetailCustom({
    super.key,
    required this.termName,
    required this.termId,
    required this.termCredit,
    required this.lecturerCode,
    required this.lecturerFullname,
    required this.classroomId,
    required this.isOnTap,
  });

  final String termName;
  final String termId;
  final String termCredit;
  final String lecturerCode;
  final String lecturerFullname;
  final String classroomId;
  final bool isOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: GlobalStyles.paddingAll18,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: GlobalStyles.paddingPageLeftRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  termName,
                  style: TextStyle(
                    color: AppColors.lightWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isOnTap
                    ? OutlinedButton(
                        onPressed: () {
                          var parameters = <String, String>{
                            "classroomId": "$classroomId",
                            "isClassroom": "true",
                          };
                          Get.toNamed(Routes.STATISTICAL,
                              parameters: parameters);
                        },
                        child: Text(
                          "Statistical",
                          style: TextStyle(color: Colors.white),
                        ))
                    : Container(),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Divider(
              thickness: 1.0,
              color: AppColors.lightWhite,
            ),
          ),
          Padding(
            padding: GlobalStyles.paddingAll,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lecturer: $lecturerFullname",
                      style: TextStyle(
                        color: AppColors.lightWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GlobalStyles.sizedBoxHeight,
                    Text(
                      "Lecturer Id:$lecturerCode",
                      style: TextStyle(
                        color: AppColors.lightWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                GlobalStyles.sizedBoxWidth_35,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Term Id: $termId",
                      style: TextStyle(
                        color: AppColors.lightWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GlobalStyles.sizedBoxHeight,
                    Text(
                      "Term Credit: $termCredit",
                      style: TextStyle(
                        color: AppColors.lightWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
