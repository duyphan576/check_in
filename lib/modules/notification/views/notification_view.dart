import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/notification/notification.dart';
import 'package:check_in/modules/notification/controllers/notification_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:check_in/constants/index.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Color(0xff262932) : Colors.white,
      body: GetBuilder<NotificationController>(
        builder: (controller) => Obx(
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
                    NotificationString.NOTIFICATION,
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
                  actions: [
                    IconButton(
                      onPressed: () {
                        controller.showConfirm();
                      },
                      icon: Icon(
                        Icons.done_all,
                      ),
                    )
                  ],
                ),
                body: controller.isLoading.value == false
                    ? Container(
                        padding: GlobalStyles.paddingAll18,
                        child: controller.notificationList.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller.notificationList.length,
                                itemBuilder: (context, index) {
                                  final NotificationModel notification =
                                      controller.notificationList[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      notification.status == "0"
                                          ? Container(
                                              padding:
                                                  GlobalStyles.paddingAll_8,
                                              decoration: BoxDecoration(
                                                color: AppColors.main
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                                      .routesPage(notification);
                                                },
                                                child: ListTile(
                                                  title: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 8.0,
                                                    ),
                                                    child: Text(
                                                      notification.title ?? "",
                                                      style: TextStyle(
                                                        color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    notification.body ?? "",
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                  trailing: Text(
                                                    controller
                                                            .getFormatDateDuration(
                                                          notification.time,
                                                        ) ??
                                                        "",
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              padding:
                                                  GlobalStyles.paddingAll_8,
                                              decoration: BoxDecoration(
                                                color: AppColors.lightWhite
                                                    .withOpacity(0.75),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: AppColors
                                                      .gray, // Color of the border
                                                  width:
                                                      1.0, // Width of the border
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  controller
                                                      .routesPage(notification);
                                                },
                                                child: ListTile(
                                                  title: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 8.0,
                                                    ),
                                                    child: Text(
                                                      notification.title ?? "",
                                                      style: TextStyle(
                                                        color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    notification.body ?? "",
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                  trailing: Text(
                                                    controller
                                                            .getFormatDateDuration(
                                                          notification.time,
                                                        ) ??
                                                        "",
                                                    style: TextStyle(
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                      GlobalStyles.sizedBoxHeight,
                                    ],
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  NotificationString.EMPTY_NOTIFICATION,
                                ),
                              ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        color: AppColors.main,
                      )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
