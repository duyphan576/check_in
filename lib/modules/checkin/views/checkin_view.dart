import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/models/classroom/classroom.dart';
import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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
                          "Check in",
                          style: TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        centerTitle: true,
                        actions: [
                          IconButton(
                            onPressed: () {
                              Get.offAndToNamed(Routes.QR);
                            },
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
                                  "Checkin History",
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
                                  color: AppColors.lightWhite.withOpacity(0.75),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 4,
                                      blurStyle: BlurStyle.outer,
                                      offset: Offset(0, 0), // Shadow position
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    colors: AppColors.listColorGradientMain,
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.isClick.value =
                                        !controller.isClick.value;
                                  },
                                  child: Container(
                                    padding:
                                        GlobalStyles.paddingPageLeftRight_15,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: DropdownButton<String>(
                                        items: controller.classroom
                                            .map<DropdownMenuItem<String>>(
                                          (element) {
                                            return DropdownMenuItem<String>(
                                              value: element.term.termName,
                                              child: Text(
                                                element.term.termName,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.lightBlack,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                        value: controller
                                            .classroom.first.term.termName,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.lightWhite,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        onChanged: (Object? value) {},
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Class name",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.lightWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(
                                  controller.isClick.value
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  size: 40,
                                  color: AppColors.lightWhite,
                                ),
                              ),
                              GlobalStyles.sizedBoxHeight_10,
                              controller.isClick.value
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
                                            offset:
                                                Offset(0, 0), // Shadow position
                                          ),
                                        ],
                                      ),
                                      child: ListView.builder(
                                        padding: GlobalStyles
                                            .paddingPageLeftRight_25,
                                        itemCount: 10,
                                        itemBuilder: (context, index) {
                                          // final Students? students =
                                          //     controller
                                          //         .studentsList[index];
                                          return ListTile(
                                            title: Text(
                                              "26/07/2023",
                                            ),
                                            trailing: Icon(Icons
                                                .check_circle_outline_rounded),
                                          );
                                        },
                                      ),
                                    )
                                  : SizedBox(),
                              GlobalStyles.sizedBoxHeight,
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
