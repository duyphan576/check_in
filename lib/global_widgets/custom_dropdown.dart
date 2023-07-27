import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends GetView<CheckinController> {
  const CustomDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: GlobalStyles.paddingAll18,
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
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
      child: DropdownButton<String>(
        items: controller.checkHistory.map<DropdownMenuItem<String>>(
          (element) {
            return DropdownMenuItem<String>(
              value: element.classroom.id.toString(),
              child: Text(
                element.classroom.term.termName,
              ),
            );
          },
        ).toList(),
        iconEnabledColor: AppColors.lightWhite,
        isExpanded: true,
        borderRadius: BorderRadius.circular(8),
        dropdownColor: Colors.transparent,
        value: controller.chooseItem.value,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: TextStyle(
          fontSize: 18,
          color: AppColors.lightWhite,
          fontWeight: FontWeight.bold,
        ),
        hint: Text("Select a classroom"),
        onChanged: (value) {
          if (controller.chooseItem.value != value!) {
            controller.chooseItem.value = value;
            controller.isClick.value = true;
            controller.checkinDate.assignAll(controller.checkHistory
                .firstWhere(
                  (element) => element.classroom.id.toString() == value,
                )
                .checkinDate);
            print(controller.checkinDate.isEmpty);
          } else
            controller.isClick.value = !controller.isClick.value;
          controller.checkinDate.assignAll(controller.checkHistory
              .firstWhere(
                (element) => element.classroom.id.toString() == value,
              )
              .checkinDate);
        },
      ),
    );
  }
}
