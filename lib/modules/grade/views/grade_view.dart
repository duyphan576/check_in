import 'package:check_in/modules/classroom/controllers/classroom_controller.dart';
import 'package:check_in/modules/grade/controllers/grade_controller.dart';
import 'package:flutter/material.dart';
import 'package:check_in/utils/api.dart';
import 'package:check_in/models/grade/grade.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../global_styles/global_styles.dart';

class GradeView extends GetView<GradeController> {
  GradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GradeController>(
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
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
                      // extendBodyBehindAppBar: true,
                      resizeToAvoidBottomInset: true,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(
                          color: AppColors.lightBlack,
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: StreamBuilder<List<Grade>>(
                            stream: controller.getStreamOfData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final List<Grade>? grades = snapshot.data;
                                return ListView.builder(
                                  itemCount: grades?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final Grade grade = grades![index];
                                    return Container(
                                      padding:
                                          GlobalStyles.paddingPageLeftRight_25,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightWhite
                                            .withOpacity(0.7),
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
                                          colors: [
                                            Color(0xFF41D8D7),
                                            Color(0xFF21A3C6),
                                            Color(0xFF285DA2),
                                            Color(0xFF332F61),
                                            Color(0xFF452E51),
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                        ),
                                      ),
                                      child: ListTile(
                                        title: Text(grade.termName.toString()),
                                        subtitle: Text(grade.termId.toString()),
                                        trailing: Text('Mark : ${grade.mark}'),
                                      ),
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                  ],
                                );
                              }
                            },
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
