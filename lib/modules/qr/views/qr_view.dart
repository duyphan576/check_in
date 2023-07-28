import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/qr_scanner_overplay.dart';
import 'package:check_in/modules/qr/controllers/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:check_in/constants/index.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrView extends GetView<QrController> {
  @override
  Widget build(BuildContext context) {
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
              "Scan QR code to checkin",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: GetBuilder<QrController>(
            builder: (controller) => Padding(
              padding: GlobalStyles.paddingPageLeftRight_25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalStyles.sizedBoxHeight,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: MobileScanner(
                          controller: controller.cameraController,
                          onDetect: (capture) {
                            controller.barcode.assignAll(capture.barcodes);
                            controller.startOrStop();
                            for (final barcode in controller.barcode) {
                              controller.saveToken(barcode.rawValue);
                            }
                          },
                        ),
                      ),
                      QRScannerOverlay(
                        overlayColour: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                  GlobalStyles.sizedBoxHeight,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
