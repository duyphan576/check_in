import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/qr_scanner_overplay.dart';
import 'package:check_in/modules/qr/controllers/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrView extends GetView<QrController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(
        //     AppImages.bg,
        //   ),
        // ),
        color: AppColors.lightWhite,
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
              color: AppColors.lightWhite,
            ),
            title: Text(
              QrString.QR,
              style: TextStyle(
                color: AppColors.lightWhite,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
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
          ),
          body: GetBuilder<QrController>(
            builder: (controller) =>
                Obx(() => controller.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: GlobalStyles.paddingAll18,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  child: MobileScanner(
                                    controller: controller.cameraController,
                                    onDetect: (capture) {
                                      controller.barcode
                                          .assignAll(capture.barcodes);
                                      for (final barcode
                                          in controller.barcode) {
                                        controller.saveToken(barcode.rawValue);
                                      }
                                    },
                                  ),
                                ),
                                Center(
                                    child: Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 300.0,
                                      width: 300.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.transparent,
                                                width: 2.0)),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: controller.animationScanner,
                                      child: Container(
                                          width: 300.0,
                                          height: 24.0,
                                          decoration: new BoxDecoration(
                                              gradient: new LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [
                                                0.0,
                                                1.0
                                              ],
                                                  colors: [
                                                controller.firstColor,
                                                controller.secondColor
                                              ]))),
                                    )
                                  ],
                                )),
                                QRScannerOverlay(
                                  overlayColour: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
          ),
        ),
      ),
    );
  }
}
