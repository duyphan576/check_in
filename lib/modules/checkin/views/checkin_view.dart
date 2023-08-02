import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/custom_dropdown.dart';
import 'package:check_in/models/checkin_date/checkin_date.dart';
import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckinView extends GetView<CheckinController> {
  CheckinView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckinController>(
      builder: (controller) {
        return Container(
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
                  CheckinString.CHECK_IN,
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                actions: [
                  Obx(
                    () => !controller.isLoading.value
                        ? Container(
                            margin: EdgeInsets.only(right: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: IconButton(
                              onPressed: () => controller.handleOpenCamera(),
                              icon: Icon(
                                Icons.qr_code,
                                color: AppColors.lightBlack,
                                size: 36,
                              ),
                            ),
                          )
                        : SizedBox(),
                  )
                ],
              ),
              body: Obx(() => controller.isLoading.value == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.main,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: GlobalStyles.paddingPageLeftRight_25,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                CheckinString.CHECKIN_HISTORY,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.main,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GlobalStyles.sizedBoxHeight,
                            controller.listCheckHistory != null &&
                                    controller.listCheckHistory.isNotEmpty ==
                                        true
                                ? Container(
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.lightWhite.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.black,
                                          blurRadius: 4,
                                          blurStyle: BlurStyle.outer,
                                        ),
                                      ],
                                    ),
                                    child: CustomDropdown(),
                                  )
                                : SizedBox(),
                            GlobalStyles.sizedBoxHeight,
                            controller.isReady.value
                                ? Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.lightWhite.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.black,
                                          blurRadius: 4,
                                          blurStyle: BlurStyle.outer,
                                        ),
                                      ],
                                    ),
                                    child: controller.checkinDate.isEmpty
                                        ? Center(
                                            child: Text(
                                              CheckinString.ATTENDANCE,
                                            ),
                                          )
                                        : ListView.builder(
                                            padding: GlobalStyles
                                                .paddingPageLeftRight_15,
                                            itemCount:
                                                controller.checkinDate.length,
                                            itemBuilder: (context, index) {
                                              final CheckinDate dates =
                                                  controller.checkinDate[index];
                                              return ListTile(
                                                leading: Icon(
                                                  dates.time == "0"
                                                      ? Icons.wb_sunny
                                                      : Icons.wb_sunny_outlined,
                                                  color: AppColors.orange,
                                                ),
                                                title: Text(
                                                  controller.getFormatDate(
                                                    dates.date,
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.lightBlack,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  dates.isChecked!.type == "0"
                                                      ? ""
                                                      : controller
                                                          .getFormatDateWithTime(
                                                          dates.isChecked!
                                                              .checkinTime,
                                                        ),
                                                ),
                                                trailing: Icon(
                                                  dates.isChecked!.type == "0"
                                                      ? Icons
                                                          .check_circle_outline_rounded
                                                      : Icons
                                                          .check_circle_rounded,
                                                  color: dates.isChecked!
                                                              .type ==
                                                          "1"
                                                      ? AppColors.greenLight
                                                      : dates.isChecked!.type ==
                                                              "2"
                                                          ? AppColors.accentBlue
                                                          : dates.isChecked!
                                                                      .type ==
                                                                  "3"
                                                              ? AppColors.red
                                                              : AppColors.black,
                                                ),
                                              );
                                            },
                                          ),
                                  )
                                : SizedBox(),
                            GlobalStyles.sizedBoxHeight_25,
                            Container(
                              padding: GlobalStyles.paddingAll,
                              decoration: BoxDecoration(
                                color: AppColors.lightWhite.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black,
                                    blurRadius: 4,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    CheckinString.NOTES,
                                    style: TextStyle(
                                      color: AppColors.main,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GlobalStyles.sizedBoxHeight_10,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.check_circle_rounded,
                                                color: AppColors.greenLight,
                                              ),
                                              GlobalStyles.sizedBoxWidth_5,
                                              Text(
                                                CheckinString.IN_ATTENDANCE,
                                                style: TextStyle(
                                                  color: AppColors.main,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight_10,
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle_rounded,
                                                color: AppColors.accentBlue,
                                              ),
                                              GlobalStyles.sizedBoxWidth_5,
                                              Text(
                                                CheckinString.MID_ATTENDANCE,
                                                style: TextStyle(
                                                  color: AppColors.main,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight_10,
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_circle_rounded,
                                                color: AppColors.red,
                                              ),
                                              GlobalStyles.sizedBoxWidth_5,
                                              Text(
                                                CheckinString.END_ATTENDANCE,
                                                style: TextStyle(
                                                  color: AppColors.main,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight_10,
                                          Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .check_circle_outline_rounded,
                                                color: AppColors.black,
                                              ),
                                              GlobalStyles.sizedBoxWidth_5,
                                              Text(
                                                CheckinString.NO_ATTENDANCE,
                                                style: TextStyle(
                                                  color: AppColors.main,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      GlobalStyles.sizedBoxWidth,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.wb_sunny,
                                                color: AppColors.orange,
                                              ),
                                              GlobalStyles.sizedBoxWidth_5,
                                              Text(
                                                CheckinString.MORNING,
                                                style: TextStyle(
                                                  color: AppColors.main,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight_10,
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.wb_sunny_outlined,
                                                color: AppColors.orange,
                                              ),
                                              GlobalStyles.sizedBoxWidth_5,
                                              Text(
                                                CheckinString.AFTERNOON,
                                                style: TextStyle(
                                                  color: AppColors.main,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
            ),
          ),
        );
      },
    );
  }
}
