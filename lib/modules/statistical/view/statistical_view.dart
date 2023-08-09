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
        return Obx(() => Scaffold(
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
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.main,
                      ),
                    )
                  : SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: GlobalStyles.paddingAll18,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: GlobalStyles.paddingAll,
                            decoration: BoxDecoration(
                              color: AppColors.lightWhite.withOpacity(0.75),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.subMain, // Color of the border
                                width: 1.0, // Width of the border
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    PeiChartWidget(
                                      listStatisticalModel: controller.listExam,
                                      title: StatisticalString.PIE_CHART_EXAM,
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                    PeiChartWidget(
                                      listStatisticalModel:
                                          controller.listFinal,
                                      title: StatisticalString.PIE_CHART_FINAL,
                                    ),
                                    GlobalStyles.sizedBoxHeight,
                                    Text(
                                      StatisticalString.NOTE,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.main,
                                          fontSize: 18),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.listExam.length,
                                      itemBuilder: (context, index) {
                                        final item = controller.listExam[index];
                                        return _build(
                                            color: AppColors
                                                .listColorStatistical[index],
                                            titleStr: item.name);
                                      },
                                    )
                                  ],
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

  Widget _build({color, titleStr}) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Icon(
              Icons.pie_chart,
              color: color,
            ),
            GlobalStyles.sizedBoxWidth,
            Text(
              titleStr,
              style: TextStyle(color: Colors.black),
            ),
          ]),
          GlobalStyles.sizedBoxHeight_10,
        ],
      ),
    );
  }
}
