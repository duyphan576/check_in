import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/grade/grade_detail_model.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:check_in/modules/grade/models/grade_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class TableCustom extends GetView<GradeController> {
  TableCustom({
    Key? key,
    required this.gradeModel,
  }) : super(key: key);

  final GradeModel gradeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: GlobalStyles.paddingAll_8,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.main,
            ),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.gray,
          ),
          child: Text(gradeModel.nameSemester ?? ""),
        ),
        GlobalStyles.sizedBoxHeight_10,
        Container(
          height: 80 + gradeModel.listGradeDetail!.length * 56,
          child: TableGradeDetailView(
            listGradeDetail: gradeModel.listGradeDetail,
          ),
        ),
        GlobalStyles.sizedBoxHeight,
        buildRow(
            title: GradeString.SEMESTER_GPA_10,
            detail: gradeModel.semesterGPA10),
        Divider(),
        buildRow(
            title: GradeString.SEMESTER_GPA_4, detail: gradeModel.semesterGPA4),
        Divider(),
        buildRow(
            title: GradeString.CUMULATIVE_GPA_10,
            detail: gradeModel.cumulativeGPA10),
        Divider(),
        buildRow(
            title: GradeString.CUMULATIVE_GPA_4,
            detail: gradeModel.cumulativeGPA4),
        Divider(),
        buildRow(
            title: GradeString.COURSE_CREDIT_ACHIEVE,
            detail: gradeModel.courseCreditsAchieve),
        Divider(),
        buildRow(
            title: GradeString.COURSE_CREDIT_ALL,
            detail: gradeModel.courseCreditsAll),
        GlobalStyles.sizedBoxHeight,
      ],
    );
  }

  Widget buildRow({title, detail}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
          textScaleFactor: 1.0,
        ),
        Text(
          detail ?? "",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textScaleFactor: 1.0,
        )
      ],
    );
  }
}

class TableGradeDetailView extends GetView<GradeController> {
  List<GradeDetailModel>? listGradeDetail;
  TableGradeDetailView({
    Key? key,
    required this.listGradeDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listGradeDetail?.isNotEmpty == false
        ? Center(
            child: Text("Không có dữ liệu để xem"),
          )
        : HorizontalDataTable(
            scrollPhysics: NeverScrollableScrollPhysics(),
            leftHandSideColumnWidth: 150,
            rightHandSideColumnWidth: 650,
            isFixedHeader: true,
            headerWidgets: controller.getListHeaderTitle(context),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: listGradeDetail?.length ?? 0,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
            horizontalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.red,
              isAlwaysShown: true,
              thickness: 4.0,
              radius: Radius.circular(5.0),
            ));
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    GradeDetailModel item = listGradeDetail![index];
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 7,
              child: InkWell(
                onTap: () {},
                child: Text(
                  "${(index + 1).toString()}. ${item.nameTerm ?? ""}",
                  style: TextStyle(
                      fontSize: 15.0,
                      // color: _colorStatus,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                  maxLines: 4,
                  textScaleFactor: 1.0,
                ),
              )),
        ],
      ),
      width: 150,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      decoration: BoxDecoration(
          border: Border(
        left: BorderSide(color: Colors.grey.shade200),
      )),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    GradeDetailModel item = listGradeDetail![index];
    return Row(
      children: controller.generateRightHandSideColumnRow(item),
    );
  }
}
