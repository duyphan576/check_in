import 'package:check_in/constants/index.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/custom_barchart.dart';
import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/global_widgets/table_custom.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradeView extends GetView<GradeController> {
  GradeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: CircularProgressIndicator(
                      color: AppColors.main,
                    ),
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
                      resizeToAvoidBottomInset: true,
                      appBar: AppBar(
                        title: Text(
                          GradeString.GRADE,
                          style: TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(
                          color: AppColors.lightBlack,
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                if (controller.isGradeFinalNull) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomBarChart(
                                        gradesLength:
                                            controller.grades.length.toDouble(),
                                        barGroupsList: controller.barGroups),
                                  );
                                } else {
                                  Alert.showError(
                                      title: AppString.ERROR,
                                      message: GradeString.ERROR_GRADE,
                                      buttonText: AppString.CANCEL);
                                }
                              },
                              icon: Icon(Icons.bar_chart,
                                  color: Colors.grey.shade600),
                            ),
                          )
                        ],
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
                              TableCustom(),
                            ],
                          ),
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
