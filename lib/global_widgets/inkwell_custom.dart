import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';

class InkWellCustom extends StatelessWidget {
  const InkWellCustom({
    super.key,
    required this.function,
    required this.text,
    required this.icon,
    required this.subText,
  });
  final function;
  final String text;
  final String subText;
  final IconData icon;

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
      ),
      child: InkWell(
        onTap: function,
        child: Container(
          padding: GlobalStyles.paddingPageLeftRight_25,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: AppColors.lightWhite,
                ),
                GlobalStyles.sizedBoxWidth,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.lightWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subText,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.lightWhite,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
