import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/custom_appbar.dart';
import 'package:check_in/models/documents/documents.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/detail/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
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
              : Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightWhite,
                  ),
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: CustomAppBar(
                        height: 120,
                      ),
                      body: SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: GlobalStyles.paddingAll18,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GlobalStyles.sizedBoxHeight,
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
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
                                child: TabBarView(
                                  controller: controller.tabController,
                                  children: <Widget>[
                                    SingleChildScrollView(
                                      child: Container(
                                        child: controller.classData.isEmpty
                                            ? Center(
                                                child: Text(
                                                  DetailString.EMPTY_INFO,
                                                ),
                                              )
                                            : Container(
                                                padding: GlobalStyles
                                                    .paddingPageLeftRight_15,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GlobalStyles.sizedBoxHeight,
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        controller.semester!,
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    GlobalStyles.sizedBoxHeight,
                                                    Divider(
                                                      color: AppColors.black,
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "${DetailString.LECTURE}: ",
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      trailing: Text(
                                                        controller.classroom!
                                                            .lecturer!.fullname
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "${DetailString.LECTURE_ID}: ",
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      trailing: Text(
                                                        controller.classroom!
                                                            .lecturer!.code
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "${DetailString.TERM_ID}: ",
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      trailing: Text(
                                                        controller
                                                            .classroom!.term!.id
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "${DetailString.TERM_CREDIT}: ",
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      trailing: Text(
                                                        controller.classroom!
                                                            .term!.credit
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      ),
                                    ),
                                    Container(
                                      child: controller.studentsList.isEmpty
                                          ? Center(
                                              child: Text(
                                                  DetailString.EMPTY_STUDENT),
                                            )
                                          : ListView.builder(
                                              padding: GlobalStyles
                                                  .paddingPageLeftRight_15,
                                              itemCount: controller
                                                  .studentsList.length,
                                              itemBuilder: (context, index) {
                                                final Students? students =
                                                    controller
                                                        .studentsList[index];
                                                return ListTile(
                                                  title: Text(
                                                    students!.code.toString(),
                                                  ),
                                                  trailing: Text(
                                                    students.fullname
                                                        .toString(),
                                                  ),
                                                );
                                              },
                                            ),
                                    ),
                                    Container(
                                      child: controller.docList.isEmpty
                                          ? Center(
                                              child:
                                                  Text(DetailString.EMPTY_DOC),
                                            )
                                          : ListView.builder(
                                              padding: GlobalStyles
                                                  .paddingPageLeftRight_15,
                                              itemCount:
                                                  controller.docList.length,
                                              itemBuilder: (context, index) {
                                                final Documents docs =
                                                    controller.docList[index];
                                                return ListTile(
                                                  title: Text(
                                                    docs.fileName.toString(),
                                                  ),
                                                  trailing: IconButton(
                                                    onPressed: () {
                                                      controller.viewPdf(
                                                        docs.url.toString(),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.remove_red_eye,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                    ),
                                  ],
                                ),
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
