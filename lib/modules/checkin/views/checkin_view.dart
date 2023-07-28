import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/index.dart';
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
                    onPressed: () => controller.handleOpenCamera(),
                    icon: Icon(
                      Icons.qr_code_scanner,
                    ),
                  )
                ],
              ),
              body: Obx(() => controller.isLoading.value == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      padding: GlobalStyles.paddingPageLeftRight_25,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Vui lòng nhấn Scan",
                                  style: TextStyle(
                                      color: AppColors.main,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                ButtonCustom(
                                  textHint: 'Scan',
                                  onFunction: () =>
                                      controller.handleOpenCamera(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
            ),
          ),
        );
      },
    );
  }
}
