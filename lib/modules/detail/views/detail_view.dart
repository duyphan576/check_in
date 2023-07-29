import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/detail_custom.dart';
import 'package:check_in/global_widgets/detail_inkwell.dart';
import 'package:check_in/models/documents/documents.dart';
import 'package:check_in/models/student/students.dart';
import 'package:check_in/modules/detail/controllers/detail_controller.dart';
import 'package:check_in/routes/app_pages.dart';
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
                        bottom: TabBar(
                          labelColor: AppColors.main,
                          unselectedLabelColor: Colors.grey,
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          unselectedLabelStyle:
                              const TextStyle(fontStyle: FontStyle.italic),
                          indicatorWeight: 2,
                          indicatorColor: AppColors.red,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding: EdgeInsets.all(4),
                          indicator: ShapeDecoration(
                            shape: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            color: AppColors.white,
                          ),
                          enableFeedback: true,
                          controller: controller.tabController,
                          tabs: <Widget>[
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Students",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.lightBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Document",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.lightBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: GlobalStyles.paddingAll18,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                classroomId:
                                    controller.classroom!.id.toString(),
                                isOnTap: true,
                              ),
                              GlobalStyles.sizedBoxHeight,
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColors.lightWhite.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 4,
                                      blurStyle: BlurStyle.outer,
                                      offset: Offset(0, 0), // Shadow position
                                    ),
                                  ],
                                ),
                                child: TabBarView(
                                  controller: controller.tabController,
                                  children: <Widget>[
                                    Container(
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
                                    ),
                                    Container(
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
                                                    ));
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
