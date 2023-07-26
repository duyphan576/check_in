import 'package:check_in/constants/app_images.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/PeiChart.dart';
import 'package:check_in/models/statistical/statistical.dart';
import 'package:check_in/modules/statistical/controllers/statistical_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class StatisticalView extends GetView<StatisticalController> {
  const StatisticalView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticalController>(
      builder: (controller) {
        // return Obx(
        //   () => controller.isLoading.value
        //       ? Center(
        //           child: CircularProgressIndicator(),
        //         )
        //       :
        return Container(
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
                  "Statistical",
                  style: TextStyle(color: Colors.black, fontSize: 24),
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
                  padding: GlobalStyles.paddingAll18,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.width / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          child: PeiChartWidget(
                            countLessThan5: controller.countLessThan5,
                            countForm5To7: controller.countForm5To7,
                            countForm7ToLessThan10:
                                controller.countForm7ToLessThan10,
                            countEqual10: controller.countEqual10,
                          )),
                      GlobalStyles.sizedBoxHeight_25,
                      Column(
                        children: [
                          controller.countLessThan5 != 0
                              ? TextWidget(
                                  color: Colors.red,
                                  titleStr: "Percentage score less than 5")
                              : Container()
                        ],
                      ),
                      GlobalStyles.sizedBoxHeight_25,
                      Container(
                        height: MediaQuery.of(context).size.width / 1.5,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: BarChart(
                            BarChartData(
                                borderData: FlBorderData(
                                  border: Border(
                                      top: BorderSide.none,
                                      right: BorderSide.none,
                                      left: BorderSide(width: 1),
                                      bottom: BorderSide(width: 1)),
                                ),
                                groupsSpace: 10,
                                barGroups: controller.barGroups),
                          ),
                        ),
                      )
                    ],
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

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.color, required this.titleStr});
  final Color color;
  final String titleStr;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Icon(
          Icons.pie_chart,
          color: color,
        ),
        GlobalStyles.sizedBoxWidth,
        Text(titleStr),
      ]),
    );
  }
}
