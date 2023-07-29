import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/custom_dropdown.dart';
import 'package:check_in/models/checkin_date/checkin_date.dart';
import 'package:check_in/models/checkin_history/checkin_history.dart';
import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          CheckinString.CHECKIN,
                          style: TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        centerTitle: true,
                        actions: [
                          IconButton(
                            onPressed: () => controller.handleOpenCamera(),
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
                                  CheckinString.CHECKIN_HISTORY,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.lightBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GlobalStyles.sizedBoxHeight,
                              Container(
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
                                child: CustomDropdown(),
                              ),
                              GlobalStyles.sizedBoxHeight_10,
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
                                                    controller
                                                        .checkinDate[index];
                                                return ListTile(
                                                  title: Text(
                                                    CheckinString.DATE,
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
