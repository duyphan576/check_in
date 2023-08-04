import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
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
          () => Container(
            decoration: BoxDecoration(
              color: AppColors.lightWhite,
            ),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  title: Text(
                    GradeString.GRADE,
                    style: TextStyle(
                      color: AppColors.lightWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: AppColors.lightWhite,
                  ),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      // color: AppColors.lightWhite,
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.bg,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        controller.showChart();
                      },
                      icon: Icon(
                        Icons.bar_chart,
                        color: AppColors.lightWhite,
                      ),
                    )
                  ],
                ),
                body: controller.isLoading.value
                    ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightWhite,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.main,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: GlobalStyles.paddingAll18,
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
                                  color: AppColors.lightWhite.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors
                                        .subMain, // Color of the border
                                    width: 1.0, // Width of the border
                                  ),
                                ),
                                child: TableCustom(),
                              ),
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
