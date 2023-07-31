import 'package:check_in/constants/app_string.dart';
import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/global_widgets/table_custom.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../global_styles/global_styles.dart';

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
                                var parameters = <String, String>{
                                  "isClassroom": "false",
                                };
                                Get.toNamed(Routes.STATISTICAL,
                                    arguments:
                                        controller.gradeFinalList.toList(),
                                    parameters: parameters);
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
                                    colors: AppColors.listColorGradientMain,
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                child: TableWidget(grades: controller.grades),
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
