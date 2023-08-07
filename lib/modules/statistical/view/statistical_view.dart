import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/pei_chart.dart';
import 'package:check_in/modules/statistical/controllers/statistical_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticalView extends GetView<StatisticalController> {
  const StatisticalView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticalController>(
      builder: (controller) {
        return Obx(() => Container(
              decoration: BoxDecoration(
                color: AppColors.lightWhite,
              ),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: Text(
                      StatisticalString.STATISTICAL,
                      style: TextStyle(
                        color: AppColors.lightWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        // color: AppColors.lightWhite,
                        image: DecorationImage(
                          image: AssetImage(
                            AppImages.bg,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: IconThemeData(
                      color: AppColors.lightWhite,
                    ),
                  ),
                  body: controller.isLoading.value
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
                      : SingleChildScrollView(
                          child: Padding(
                            padding: GlobalStyles.paddingAll18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.78,
                                  padding: GlobalStyles.paddingAll,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.lightWhite.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors
                                          .subMain, // Color of the border
                                      width: 1.0, // Width of the border
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      PeiChartWidget(
                                        countLessThan4Percentage:
                                            controller.countLessThan4Percentage,
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
                                        countGreaterThan85Percentage: controller
                                            .countGreaterThan85Percentage,
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
