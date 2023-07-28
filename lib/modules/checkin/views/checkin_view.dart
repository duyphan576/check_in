import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/custom_dropdown.dart';
import 'package:check_in/models/checkin_date/checkin_date.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CheckinView extends GetView<CheckinController> {
  CheckinView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckinController>(
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
                  width: double.infinity,
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
                          color: AppColors.main,
                        ),
                        title: Text(
                          "Check in",
                          style: TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        centerTitle: true,
                        actions: [
                          IconButton(
                            onPressed: () {
                              Get.offAndToNamed(Routes.QR);
                            },
                            icon: Icon(
                              Icons.qr_code,
                            ),
                          )
                        ],
                      ),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: GlobalStyles.paddingPageLeftRight_25,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Checkin History",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.lightBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GlobalStyles.sizedBoxHeight,
                              // CustomDropdown(),
                              Container(
                                padding: GlobalStyles.paddingAll18,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColors.lightWhite.withOpacity(0.75),
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
                                child: InkWell(
                                  onTap: () {
                                    controller.isClick.value =
                                        !controller.isClick.value;
                                    controller.isReady.value = false;
                                  },
                                  child: ListTile(
                                    title: Text(
                                      controller.termName.value == ""
                                          ? "Select a classroom"
                                          : controller.termName.value,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.lightWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      controller.isClick.value
                                          ? Icons.arrow_upward
                                          : Icons.arrow_downward,
                                      color: AppColors.lightWhite,
                                    ),
                                  ),
                                ),
                              ),
                              GlobalStyles.sizedBoxHeight_10,
                              GlobalStyles.sizedBoxHeight_10,
                              controller.isClick.value
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightWhite
                                            .withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(8),
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
                                      child: controller.checkHistory.isEmpty
                                          ? Center(
                                              child: Text(
                                                  " You don't have any class."),
                                            )
                                          : ListView.builder(
                                              padding: GlobalStyles
                                                  .paddingPageLeftRight_15,
                                              itemCount: controller
                                                  .checkHistory.length,
                                              itemBuilder: (context, index) {
                                                final Classroom classroom =
                                                    controller
                                                        .checkHistory[index]
                                                        .classroom;
                                                return ListTile(
                                                  title: Text(
                                                    classroom.term.termName,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          AppColors.lightBlack,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  trailing: IconButton(
                                                    icon:
                                                        Icon(Icons.visibility),
                                                    onPressed: () {
                                                      controller
                                                              .termName.value =
                                                          classroom
                                                              .term.termName;
                                                      controller.isClick.value =
                                                          !controller
                                                              .isClick.value;
                                                      controller.isReady.value =
                                                          true;
                                                      controller.getDateCheckin(
                                                          classroom.id
                                                              .toString());
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                    )
                                  : SizedBox(),
                              controller.isReady.value
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightWhite
                                            .withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(8),
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
                                      child: controller.checkinDate.isEmpty
                                          ? Center(
                                              child: Text(
                                                  "Your class has never been in attendance"),
                                            )
                                          : ListView.builder(
                                              padding: GlobalStyles
                                                  .paddingPageLeftRight_15,
                                              itemCount:
                                                  controller.checkinDate.length,
                                              itemBuilder: (context, index) {
                                                final CheckinDate dates =
                                                    controller
                                                        .checkinDate[index];
                                                return ListTile(
                                                  title: Text(
                                                    "Date",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          AppColors.lightBlack,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    controller.getFormatedDate(
                                                      dates.date.toString(),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          AppColors.lightBlack,
                                                    ),
                                                  ),
                                                  trailing: Icon(
                                                    dates.isChecked
                                                        ? Icons
                                                            .check_circle_rounded
                                                        : Icons
                                                            .check_circle_outlined,
                                                    color: dates.isChecked
                                                        ? AppColors.green
                                                        : AppColors.red,
                                                  ),
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
