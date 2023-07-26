import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
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
    return GetBuilder<GradeController>(
      builder: (controller) {
        return Obx(
          () => Container(
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
                body: LayoutBuilder(
                  builder: (context, constraints) {
                    return Padding(
                      padding: GlobalStyles.paddingPageLeftRight_25,
                      child: Column(
                        children: [
                          StudentPicture(
                            name: controller.userData["fullname"],
                            code: controller.userData["code"].toString(),
                            grade:
                                double.tryParse(controller.avgGrade.toString()),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1.4,
                              width: MediaQuery.of(context).size.width,
                              child: controller.grades.isEmpty
                                  ? Center(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "You don't have any grade.",
                                          style: TextStyle(
                                            color: AppColors.lightBlack,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: controller.grades.length,
                                      itemBuilder: (context, index) {
                                        final Grade grade =
                                            controller.grades[index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Container(
                                            padding: GlobalStyles
                                                .paddingPageLeftRight_25,
                                            decoration: BoxDecoration(
                                              color: AppColors.lightWhite
                                                  .withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.black,
                                                  blurRadius: 2,
                                                  blurStyle: BlurStyle.outer,
                                                  offset: Offset(
                                                      0, 0), // Shadow position
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
                                            child: ListTile(
                                              title: Text(
                                                grade.termName.toString(),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                  ' Id :${grade.termId.toString()}',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              trailing: Text(
                                                  'Grade : ${grade.grade.toString()}',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
