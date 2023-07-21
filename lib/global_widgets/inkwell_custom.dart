import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';

class InkWellCustom extends StatelessWidget {
  const InkWellCustom({
    super.key,
    this.function,
    this.text,
    this.icon,
    this.subText,
    this.height,
    this.width,
  });
  final function;
  final String? text;
  final String? subText;
  final IconData? icon;
  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightWhite.withOpacity(0.9),
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
      child: InkWell(
        onTap: function,
        child: Container(
          padding: GlobalStyles.paddingPageLeftRight_25,
          height: height * 0.1,
          width: width,
          child: Row(children: [
            icon != null
                ? Icon(
                    icon,
                    size: 40,
                    color: AppColors.lightWhite,
                  )
                : SizedBox(
                    width: 40,
                  ),
            GlobalStyles.sizedBoxWidth,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text ?? "",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.lightWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subText != null && subText?.isNotEmpty == true
                    ? Text(
                        subText ?? "",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.lightWhite,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
