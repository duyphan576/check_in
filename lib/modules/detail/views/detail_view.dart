import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/detail_custom.dart';
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
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.bg,
                      ),
                    ),
                  ),
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
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(
                          color: AppColors.lightBlack,
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Container(
                          child: Padding(
                            padding: GlobalStyles.paddingAll18,
                            child: Column(
                              children: [
                                DetailCustom(
                                  termName: controller.classroom!.term.termName,
                                  lecturerFullname:
                                      controller.classroom!.lecturer.fullname,
                                  lecturerCode:
                                      controller.classroom!.lecturer.code,
                                  termId:
                                      controller.classroom!.term.id.toString(),
                                  termCredit: controller.classroom!.term.credit
                                      .toString(),
                                ),
                                GlobalStyles.sizedBoxHeight,
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.lightWhite.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black,
                                        blurRadius: 4,
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
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.isDocClick.value =
                                              !controller.isDocClick.value;
                                        },
                                        child: Container(
                                          padding: GlobalStyles
                                              .paddingPageLeftRight_15,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: ListTile(
                                              title: Text(
                                                "Documents List",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.lightWhite,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              trailing: Icon(
                                                controller.isDocClick.value
                                                    ? Icons.arrow_drop_down
                                                    : Icons.arrow_drop_up,
                                                size: 40,
                                                color: AppColors.lightWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GlobalStyles.sizedBoxHeight_10,
                                controller.isDocClick.value
                                    ? Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: AppColors.lightWhite
                                              .withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.black,
                                              blurRadius: 4,
                                              blurStyle: BlurStyle.outer,
                                              // offset: Offset(
                                              //     0, 0), // Shadow position
                                            ),
                                          ],
                                        ),
                                        child: controller.studentsList.isEmpty
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                padding: GlobalStyles
                                                    .paddingPageLeftRight_25,
                                                itemCount:
                                                    controller.docList.length,
                                                itemBuilder: (context, index) {
                                                  final Documents docs =
                                                      controller.docList[index];
                                                  return ListTile(
                                                      title: Text(
                                                        docs.fileName
                                                            .toString(),
                                                      ),
                                                      trailing: IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .DownloadDocument(
                                                                  docs.url
                                                                      .toString()
                                                                      .trim(),
                                                                  docs.fileName
                                                                      .toString()
                                                                      .trim());
                                                        },
                                                        icon: Icon(
                                                          Icons.download,
                                                        ),
                                                      ));
                                                },
                                              ),
                                      )
                                    : SizedBox(),
                                GlobalStyles.sizedBoxHeight,
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.lightWhite.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black,
                                        blurRadius: 4,
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
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.isStuClick.value =
                                              !controller.isStuClick.value;
                                        },
                                        child: Container(
                                          padding: GlobalStyles
                                              .paddingPageLeftRight_15,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: ListTile(
                                              title: Text(
                                                "List of Students",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.lightWhite,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              trailing: Icon(
                                                controller.isStuClick.value
                                                    ? Icons.arrow_drop_down
                                                    : Icons.arrow_drop_up,
                                                size: 40,
                                                color: AppColors.lightWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GlobalStyles.sizedBoxHeight_10,
                                controller.isStuClick.value
                                    ? Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: AppColors.lightWhite
                                              .withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.black,
                                              blurRadius: 4,
                                              blurStyle: BlurStyle.outer,
                                              offset: Offset(
                                                  0, 0), // Shadow position
                                            ),
                                          ],
                                        ),
                                        child: controller.studentsList.isEmpty
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                padding: GlobalStyles
                                                    .paddingPageLeftRight_25,
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
                                                    trailing: Text(students
                                                        .fullname
                                                        .toString()),
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
                ),
        );
      },
    );
  }
}
