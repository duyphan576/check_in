import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';

class InkWellCustom extends StatelessWidget {
  const InkWellCustom({
    super.key,
    required this.function,
    required this.text,
    required this.icon,
  });
  final function;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 38,
                  color: AppColors.lightWhite,
                ),
                GlobalStyles.sizedBoxHeight,
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.lightWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
