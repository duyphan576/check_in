import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/grade/grade.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownGrade extends GetView<GradeController> {
  const DropdownGrade({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Grade>(
        key: controller.keyGradeClass,
        items: controller.grades,
        compareFn: (item1, item2) =>
            item1.termId.toString() == item2.termId.toString(),
        itemAsString: (Grade item) => item.termName.toString(),
        selectedItem: controller.grades[0],
        onChanged: (value) {
          controller.isReady.value = true;
          controller.getGradeSelected(value!.termId.toString());
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.main),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        dropdownBuilder: (context, selectedItem) {
          return Container(
            child: RichText(
              maxLines: 5,
              textScaleFactor: 1,
              text: TextSpan(
                  text: selectedItem?.termName.toString() ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
          );
        },
        dropdownButtonProps: DropdownButtonProps(
          icon: Icon(Icons.arrow_drop_down_sharp),
        ),
        popupProps: PopupProps.modalBottomSheet(
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Chọn lớp",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.main,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          showSelectedItems: true,
          showSearchBox: false,
          containerBuilder: (context, popupWidget) {
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              padding: GlobalStyles.paddingAll18,
              width: MediaQuery.of(context).size.width,
              child: popupWidget,
            );
          },
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
            contentPadding: GlobalStyles.paddingPageLeftRight,
            label: Text("Hãy nhập tên lớp"),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.main),
                borderRadius: BorderRadius.circular(8)),
          )),
          itemBuilder: (context, item, isSelected) {
            return Container(
              margin: GlobalStyles.paddingPageLeftRight_15,
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
                  item.termName.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: isSelected
                          ? AppColors.greenLight
                          : AppColors.lightBlack,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ));
  }
}
