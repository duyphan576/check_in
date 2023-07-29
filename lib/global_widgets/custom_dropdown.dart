import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/checkin_history/checkin_history.dart';
import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends GetView<CheckinController> {
  const CustomDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GlobalStyles.paddingPageLeftRight_25,
      child: DropdownSearch<CheckinHistory>(
        items: controller.checkHistory,
        compareFn: (i, c) => i.classroom.id == c.classroom.id,
        itemAsString: (CheckinHistory item) => item.classroom.term.termName,
        onChanged: (value) {
          controller.isReady.value = true;
          controller.getDateCheckin(value!.classroom.id.toString());
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: CheckinString.CLASSROOM,
            border: InputBorder.none,
          ),
        ),
        popupProps: PopupProps.modalBottomSheet(
          showSelectedItems: true,
          showSearchBox: true,
          containerBuilder: (context, popupWidget) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              padding: GlobalStyles.paddingAll18,
              width: MediaQuery.of(context).size.width,
              child: popupWidget,
            );
          },
          itemBuilder: (context, item, isSelected) {
            return Container(
              margin: GlobalStyles.paddingPageLeftRight,
              decoration: !isSelected
                  ? null
                  : BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
              child: ListTile(
                selected: isSelected,
                title: Text(
                  item.classroom.term.termName,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightBlack,
                  ),
                ),
                trailing: Text(
                  item.classroom.id.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightBlack,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
