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
        color: AppColors.lightWhite.withOpacity(0.75),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.subMain, // Color of the border
          width: 1.0, // Width of the border
        ),
        // gradient: LinearGradient(
        //   colors: AppColors.listColorGradientMain,
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.topRight,
        // ),
      ),
      child: InkWell(
        onTap: function,
        child: Container(
          padding: GlobalStyles.paddingPageLeftRight_25,
          height: height * 0.1,
          width: width,
          child: Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: 40,
                      color: AppColors.subMain,
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
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subText != null && subText?.isNotEmpty == true
                      ? Text(
                          subText ?? "",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
