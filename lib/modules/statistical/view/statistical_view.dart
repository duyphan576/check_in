import 'package:check_in/constants/app_images.dart';
import 'package:check_in/constants/app_string.dart';
import 'package:check_in/global_styles/global_styles.dart';
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
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.main,
                    ),
                  ),
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
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: GlobalStyles.paddingAll,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width / 0.6,
                              padding: GlobalStyles.paddingAll,
                              decoration: BoxDecoration(
                                color: AppColors.lightWhite.withOpacity(1),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black,
                                    blurRadius: 4,
                                    blurStyle: BlurStyle.outer,
                                    offset: Offset(0, 0), // Shadow position
                                  ),
                                ],
                                // gradient: LinearGradient(
                                //   colors: AppColors.listColorGradientMain,
                                //   begin: Alignment.bottomLeft,
                                //   end: Alignment.topRight,
                                // ),
                              ),
                              child: Column(
                                children: [
                                  PeiChartWidget(
                                    countLessThan4Percentage:
                                        controller.countLessThan4Percentage,
                                    countForm4ToLessThan55Percentage: controller
                                        .countForm4ToLessThan55Percentage,
                                    countForm55ToLessThan7Percentage: controller
                                        .countForm55ToLessThan7Percentage,
                                    countFor7ToLessThan85Percentage: controller
                                        .countFor7ToLessThan85Percentage,
                                    count: controller.count,
                                    countGreaterThan85Percentage:
                                        controller.countGreaterThan85Percentage,
                                    pieAnouce: StatisticalString.PIE_CHART,
                                  )
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
