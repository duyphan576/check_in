import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/modules/classroom/controllers/classroom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassroomView extends GetView<ClassroomController> {
  const ClassroomView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassroomController>(
      builder: (controller) {
        return Obx(() => Container(
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
                      ClassroomString.CLASSROOM,
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
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: controller.classrooms.isEmpty
                          ? Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator()),
                            )
                          : ListView.builder(
                              padding: GlobalStyles.paddingPageLeftRight_25,
                              itemCount: controller.classrooms.length,
                              itemBuilder: (context, index) {
                                final Classroom classroom =
                                    controller.classrooms[index];
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding:
                                          GlobalStyles.paddingPageLeftRight_25,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightWhite
                                            .withOpacity(0.75),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black,
                                            blurRadius: 4,
                                            blurStyle: BlurStyle.outer,
                                            offset:
                                                Offset(0, 0), // Shadow position
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          colors:
                                              AppColors.listColorGradientMain,
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          controller.getClassInfo(
                                            classroom.id.toString(),
                                          );
                                        },
                                        child: ListTile(
                                          title: Text(
                                            classroom.term.termName,
                                            style: TextStyle(
                                              color: AppColors.lightWhite,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            classroom.lecturer.fullname,
                                            style: TextStyle(
                                              color: AppColors.lightWhite,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          trailing: Text(
                                            '${ClassroomString.CREDIT}: ${classroom.term.credit}',
                                            style: TextStyle(
                                              color: AppColors.lightWhite,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                  ],
                                );
                              },
                            ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
