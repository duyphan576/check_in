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
    return DropdownSearch<CheckinHistory>(
      key: controller.keyHistoryCheckIn,
      items: controller.listCheckHistory,
      compareFn: (i, c) => i.classroom == c.classroom,
      itemAsString: (CheckinHistory item) => item.classroom!.term!.termName!,
      selectedItem: controller.listCheckHistory[0],
      onChanged: (value) {
        controller.isReady.value = true;
        controller.getDateCheckin(value!.classroom!.id.toString());
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
      dropdownBuilder: (context, item) {
        return Container(
          child: RichText(
            maxLines: 5,
            textScaleFactor: 1.0,
            text: TextSpan(
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                text: item?.checkinDate!.length.toString() != null
                    ? "(${item?.checkinDate!.length.toString()}) "
                    : "",
                children: [
                  TextSpan(
                    text: item?.classroom!.term!.termName ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ]),
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
            CheckinString.CHOOSE_CLASSROOM,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.main,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
        searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
          contentPadding: GlobalStyles.paddingPageLeftRight,
          label: Text(CheckinString.ENTER_CLASSROOM),
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
                item.classroom!.term!.termName!,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? AppColors.subMain : AppColors.lightBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
