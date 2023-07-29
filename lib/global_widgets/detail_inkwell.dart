import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/detail/controllers/detail_controller.dart';

class DetailInkWell extends GetView<DetailController> {
  const DetailInkWell({
    required this.text,
    required this.function,
    super.key,
  });

  final String text;
  final function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: GlobalStyles.paddingPageLeftRight_15,
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.lightWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              controller.isStuClick.value
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
              size: 40,
              color: AppColors.lightWhite,
            ),
          ),
        ),
      ),
    );
  }
}
