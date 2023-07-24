import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/constants/app_images.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/pdf_page/controllers/pdf_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class PdfPageView extends GetView<PdfPageController> {
  PdfPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfPageController>(
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
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(
                          color: AppColors.lightBlack,
                        ),
                        actions: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.navigate_before),
                            onPressed: () {
                              controller.pdfController.previousPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 100),
                              );
                            },
                          ),
                          PdfPageNumber(
                            controller: controller.pdfController,
                            builder: (_, loadingState, page, pagesCount) =>
                                Container(
                              alignment: Alignment.center,
                              child: Text(
                                '$page/${pagesCount ?? 0}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.lightBlack,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.navigate_next),
                            onPressed: () {
                              controller.pdfController.nextPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 100),
                              );
                            },
                          ),
                        ],
                      ),
                      body: PdfView(
                        builders: PdfViewBuilders<DefaultBuilderOptions>(
                          options: const DefaultBuilderOptions(),
                          documentLoaderBuilder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                          pageLoaderBuilder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        controller: controller.pdfController,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
