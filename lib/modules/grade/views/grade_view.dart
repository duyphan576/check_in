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
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
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
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors.lightBlack.withOpacity(0.7),
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
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black,
                                        blurRadius: 2,
                                        blurStyle: BlurStyle.outer,
                                        offset: Offset(0, 0),
                                      )
                                    ]),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 25,
                                  child: Text(
                                      "${controller.userData['name'].toString().substring(0, 1)}",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${controller.userData['fullname']}",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                Text("${controller.userData['code']}",
                                    style: TextStyle(color: Colors.black45))
                              ],
                            )
                          ],
                        ),
                      ),
                      body: LayoutBuilder(
                        builder: (context, constraints) {
                          return Padding(
                            padding: GlobalStyles.paddingPageLeftRight_25,
                            child: Column(
                              children: [
                                // StudentPicture(name: controller.,)
                              ],
                            ),
                          );
                        },
                      ),
                      bottomNavigationBar: BottomAppBar(
                        color: Colors.white.withOpacity(0.7),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                              height: 30,
                              // alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text("Điểm trung bình :"),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        controller.avgGrade is! double
                                            ? CircularProgressIndicator()
                                            : Text(
                                                controller.avgGrade.toString()),
                                      ],
                                    ),
                                  )
                                ],
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
