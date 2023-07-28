import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:check_in/models/grade/grade.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../global_styles/global_styles.dart';

class GradeView extends GetView<GradeController> {
  GradeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyleBold = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
    final TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 16);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<GradeController>(
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
              ? Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    AppImages.bg,
                  ))),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.bg,
                      ),
                    ),
                  ),
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      // extendBodyBehindAppBar: true,
                      resizeToAvoidBottomInset: true,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(
                          color: AppColors.lightBlack,
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: GlobalStyles.paddingPageLeftRight_25,
                          child: Column(
                            children: [
                              StudentPicture(
                                name: controller.userData["fullname"],
                                code: controller.userData!["code"].toString(),
                                height: height,
                                width: width,
                                grade: controller.avgGrade.toString(),
                              ),
                              GlobalStyles.sizedBoxHeight,
                              Container(
                                height: MediaQuery.of(context).size.width / 0.8,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColors.lightWhite.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 2,
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
                                child: Table(
                                  border: TableBorder(
                                    horizontalInside:
                                        BorderSide(color: Colors.white),
                                    verticalInside:
                                        BorderSide(color: Colors.white),
                                  ),
                                  columnWidths: const <int, TableColumnWidth>{
                                    0: IntrinsicColumnWidth(),
                                    1: FixedColumnWidth(60),
                                    2: FixedColumnWidth(30),
                                    3: FixedColumnWidth(30),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Term",
                                              style: textStyleBold),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Attendance Grade",
                                              style: textStyleBold),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Exam Grade",
                                              style: textStyleBold),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Final Grade",
                                              style: textStyleBold),
                                        ),
                                      ),
                                    ]),
                                    for (int i = 0;
                                        i < controller.grades.length;
                                        i++)
                                      TableRow(children: [
                                        Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                                controller.grades[i].termName
                                                    .toString(),
                                                style: textStyleBold),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                                controller
                                                    .grades[i].attendanceGrade
                                                    .toString(),
                                                style: textStyle),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                                controller.grades[i].examGrade
                                                    .toString(),
                                                style: textStyle),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                                controller.grades[i].finalGrade
                                                    .toString(),
                                                style: textStyle),
                                          ),
                                        ),
                                      ]),
                                    // Dòng dữ liệu từ controller.grades
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.endDocked,
                      floatingActionButton: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColors.lightWhite.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black,
                                blurRadius: 2,
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
                          child: TextButton(
                              onPressed: () {
                                var parameters = <String, String>{
                                  "isClassroom": "false",
                                };
                                Get.toNamed(Routes.STATISTICAL,
                                    arguments: controller.gradeFinalList,
                                    parameters: parameters);
                              },
                              child: Text(
                                "Satistical",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
