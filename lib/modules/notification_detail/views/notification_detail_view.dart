import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/notification_detail/controllers/notification_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NotificationDetailView extends GetView<NotificationDetailController> {
  const NotificationDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationDetailController>(
      builder: (controller) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              title: Text(
                NotificationDetailString.TITLE_NOTIFICATION_DETAIL,
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
                            children: [
                              Html(
                                data: controller.content.value,
                                onLinkTap: (url, attributes, element) async {
                                  await launchUrlString(url!);
                                },
                                style: {
                                  "img": Style(),
                                  "table": Style(
                                    backgroundColor:
                                        Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                                  ),
                                  "tr": Style(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.grey)),
                                  ),
                                  "th": Style(
                                    padding: HtmlPaddings.all(6),
                                    backgroundColor: Colors.grey,
                                  ),
                                  "td": Style(
                                    padding: HtmlPaddings.all(6),
                                    alignment: Alignment.topLeft,
                                  ),
                                  'h5': Style(
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                },
                              )
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
