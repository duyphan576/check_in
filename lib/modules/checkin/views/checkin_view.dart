import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/checkin/controllers/checkin_controller.dart';
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
                      ),
                      body: Container(
                        padding: GlobalStyles.paddingPageLeftRight_25,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Text(
                                  "Check in",
                                  style: TextStyle(
                                    color: AppColors.lightBlack,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            GlobalStyles.sizedBoxHeight,
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 2,
                                  child: MobileScanner(
                                    controller: controller.cameraController,
                                    onDetect: (capture) {
                                      controller.barcode
                                          .assignAll(capture.barcodes);
                                      for (final barcode
                                          in controller.barcode) {
                                        debugPrint(
                                            'Barcode found! ${barcode.rawValue}');
                                        controller.checkin(barcode.rawValue);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            GlobalStyles.sizedBoxHeight,
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                color: Colors.black.withOpacity(0.4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: controller
                                          .cameraController.hasTorchState,
                                      builder: (context, state, child) {
                                        if (state != true) {
                                          return const SizedBox.shrink();
                                        }
                                        return IconButton(
                                          color: Colors.white,
                                          icon: ValueListenableBuilder(
                                            valueListenable: controller
                                                .cameraController.torchState,
                                            builder: (context, state, child) {
                                              if (state == null) {
                                                return const Icon(
                                                  Icons.flash_off,
                                                  color: Colors.grey,
                                                );
                                              }
                                              switch (state) {
                                                case TorchState.off:
                                                  return const Icon(
                                                    Icons.flash_off,
                                                    color: Colors.white,
                                                  );
                                                case TorchState.on:
                                                  return const Icon(
                                                    Icons.flash_on,
                                                    color: Colors.yellow,
                                                  );
                                              }
                                            },
                                          ),
                                          iconSize: 24.0,
                                          onPressed: () => controller
                                              .cameraController
                                              .toggleTorch(),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      color: Colors.white,
                                      icon: controller.isStarted.value
                                          ? const Icon(Icons.stop)
                                          : const Icon(Icons.play_arrow),
                                      iconSize: 24.0,
                                      onPressed: () {
                                        controller.startOrStop();
                                      },
                                    ),
                                    IconButton(
                                      color: Colors.white,
                                      icon: ValueListenableBuilder(
                                        valueListenable: controller
                                            .cameraController.cameraFacingState,
                                        builder: (context, state, child) {
                                          if (state == null) {
                                            return const Icon(
                                                Icons.camera_front);
                                          }
                                          switch (state) {
                                            case CameraFacing.front:
                                              return const Icon(
                                                  Icons.camera_front);
                                            case CameraFacing.back:
                                              return const Icon(
                                                  Icons.camera_rear);
                                          }
                                        },
                                      ),
                                      iconSize: 24.0,
                                      onPressed: () => controller
                                          .cameraController
                                          .switchCamera(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
