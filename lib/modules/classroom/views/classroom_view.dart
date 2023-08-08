import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/custom_dropdown.dart';
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
                    ClassroomString.CLASSROOM,
                    style: TextStyle(
                      color: AppColors.lightWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.bg,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: AppColors.lightWhite,
                  ),
                ),
                body: controller.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.main,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: GlobalStyles.paddingAll18,
                          child: Column(
                            children: [
                              controller.classBySemesterList.isNotEmpty == true
                                  ? CustomClassList()
                                  : SizedBox(),
                              GlobalStyles.sizedBoxHeight,
                              controller.classrooms.isNotEmpty == true
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: controller.classrooms.isEmpty
                                          ? Center(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColors.main,
                                                ),
                                              ),
                                            )
                                          : ListView.builder(
                                              itemCount:
                                                  controller.classrooms.length,
                                              itemBuilder: (context, index) {
                                                final Classroom classroom =
                                                    controller
                                                        .classrooms[index];
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: GlobalStyles
                                                          .paddingPageLeftRight_25,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .lightWhite
                                                            .withOpacity(0.75),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                          color: AppColors
                                                              .subMain, // Color of the border
                                                          width:
                                                              1.0, // Width of the border
                                                        ),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller
                                                              .getClassInfo(
                                                            classroom.id
                                                                .toString(),
                                                          );
                                                        },
                                                        child: ListTile(
                                                          title: Text(
                                                            classroom.term!
                                                                .termName!,
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          subtitle: Text(
                                                            classroom.lecturer!
                                                                .fullname!,
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          trailing: Text(
                                                            '${ClassroomString.CREDIT}: ${classroom.term!.credit}',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                    )
                                  : SizedBox(),
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
