import 'package:check_in/constants/app_images.dart';
import 'package:check_in/constants/app_string.dart';
import 'package:check_in/core/alert.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/bar_chart.dart';
import 'package:check_in/global_widgets/pei_chart.dart';
import 'package:check_in/modules/statistical/controllers/statistical_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class StatisticalView extends GetView<StatisticalController> {
  const StatisticalView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticalController>(
      builder: (controller) {
        return Obx(() => controller.isLoading.value
            ? Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.bg,
                        ),
                      ),
                    ),
                    child: Center(child: CircularProgressIndicator())),
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
                      title: Text(
                        StatisticalString.STATISTICAL,
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
                      actions: [
                        controller.isClassroom
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                    IconButton(
                                      onPressed: () {
                                        Alert.showInfo(
                                          title: StatisticalString.NOTE,
                                          buttonText: CommonString.OK,
                                          widget: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GlobalStyles.sizedBoxHeight_10,
                                                Text(
                                                  StatisticalString.GRADE_F,
                                                  style:
                                                      TextStyle(fontSize: 12.5),
                                                ),
                                                GlobalStyles.sizedBoxHeight_10,
                                                Text(
                                                  StatisticalString.GRADE_D,
                                                  style:
                                                      TextStyle(fontSize: 12.5),
                                                ),
                                                GlobalStyles.sizedBoxHeight_10,
                                                Text(
                                                  StatisticalString.GRADE_C,
                                                  style:
                                                      TextStyle(fontSize: 12.5),
                                                ),
                                                GlobalStyles.sizedBoxHeight_10,
                                                Text(
                                                  StatisticalString.GRADE_B,
                                                  style:
                                                      TextStyle(fontSize: 12.5),
                                                ),
                                                GlobalStyles.sizedBoxHeight_10,
                                                Text(
                                                  StatisticalString.GRADE_A,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.info_outline_rounded,
                                        size: 28,
                                      ),
                                    )
                                  ]),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: GlobalStyles.paddingAll,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.isClassroom
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width / 0.6,
                                    padding: GlobalStyles.paddingAll,
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
                                        colors: AppColors.listColorGradientMain,
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        PeiChartWidget(
                                          countLessThan4Percentage: controller
                                              .countLessThan4Percentage,
                                          countForm4ToLessThan55Percentage:
                                              controller
                                                  .countForm4ToLessThan55Percentage,
                                          countForm55ToLessThan7Percentage:
                                              controller
                                                  .countForm55ToLessThan7Percentage,
                                          countFor7ToLessThan85Percentage:
                                              controller
                                                  .countFor7ToLessThan85Percentage,
                                          count: controller.count,
                                          countGreaterThan85Percentage:
                                              controller
                                                  .countGreaterThan85Percentage,
                                          pieAnouce1:
                                              StatisticalString.PIE_CHART,
                                          pieAnouce2:
                                              StatisticalString.PIE_ANNOUNCE,
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width / 0.6,
                                    padding: GlobalStyles.paddingAll,
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
                                        colors: AppColors.listColorGradientMain,
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        BarChartWidget(
                                            gradesLength: controller
                                                .count.length
                                                .toDouble(),
                                            barGroupsList:
                                                controller.barGroups),
                                        GlobalStyles.sizedBoxHeight_10,
                                        Padding(
                                          padding: GlobalStyles
                                              .paddingPageLeftRight_15,
                                          child: Column(
                                            children: [
                                              Text(
                                                StatisticalString.BAR_CHART,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                StatisticalString.BAR_ANNOUNCE,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                              GlobalStyles.sizedBoxHeight_10,
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      StatisticalString
                                                          .BAR_NOTE,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 16)),
                                                  GlobalStyles
                                                      .sizedBoxHeight_10,
                                                  Text(
                                                    StatisticalString
                                                        .BAR_NOTE_XAXIS,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  GlobalStyles
                                                      .sizedBoxHeight_10,
                                                  Text(
                                                    StatisticalString
                                                        .BAR_NOTE_YAXIS,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  GlobalStyles
                                                      .sizedBoxHeight_10,
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                          ],
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
