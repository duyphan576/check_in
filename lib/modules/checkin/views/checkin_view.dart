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
                                color: AppColors.main,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: IconButton(
                              onPressed: () => controller.handleOpenCamera(),
                              icon: Icon(
                                Icons.qr_code,
                                color: AppColors.lightWhite,
                              ),
                            ),
                          )
                        : SizedBox(),
                  )
                ],
              ),
              body: Obx(() => controller.isLoading.value == true
                  ? Center(
                      child: CircularProgressIndicator(),
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
                                        0.6,
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
                                                title: Row(
                                                  children: [
                                                    Expanded(
                                                      child: dates.isChecked
                                                          ? Text(
                                                              controller
                                                                  .getFormatDate(
                                                                dates.date
                                                                    .toString(),
                                                              ),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: AppColors
                                                                      .accentBlue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          : SizedBox(),
                                                    ),
                                                    Expanded(
                                                      child: !dates.isChecked
                                                          ? Text(
                                                              controller
                                                                  .getFormatDate(
                                                                dates.date
                                                                    .toString(),
                                                              ),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color:
                                                                      AppColors
                                                                          .main,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          : SizedBox(),
                                                    ),
                                                  ],
                                                ),
                                                trailing: Icon(
                                                  dates.isChecked
                                                      ? Icons
                                                          .check_circle_rounded
                                                      : Icons
                                                          .check_circle_outlined,
                                                  color: dates.isChecked
                                                      ? AppColors.greenLight
                                                      : AppColors.red,
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
                                    "Ghi chú",
                                    style: TextStyle(
                                      color: AppColors.main,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle_rounded,
                                          color: AppColors.greenLight),
                                      GlobalStyles.sizedBoxWidth,
                                      Text(
                                        CheckinString.PRESENCE,
                                        style: TextStyle(
                                          color: AppColors.main,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GlobalStyles.sizedBoxHeight,
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_outlined,
                                        color: AppColors.red,
                                      ),
                                      GlobalStyles.sizedBoxWidth,
                                      Text(
                                        CheckinString.NO_PRESENCE,
                                        style: TextStyle(
                                          color: AppColors.main,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
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
