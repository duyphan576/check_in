import 'package:check_in/constants/index.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationWidget extends GetView<HomeController> {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          Get.toNamed(Routes.NOTIFICATION)!
              .then((value) => controller.countUnreadMessage());
        },
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: kMinInteractiveDimension,
                minHeight: kMinInteractiveDimension,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Align(
                      alignment: Alignment.center,
                      child: IconTheme.merge(
                        data: IconThemeData(
                          size: 24,
                          color: Color(0xff4eb1dd),
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.white,
                        ),
                      )),
                ),
              ),
            ),
            Visibility(
              visible: controller.countUnreadMessage.value != 0,
              child: Positioned(
                left: 25,
                top: 5,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Obx(
                    () => Text(
                      controller.countUnreadMessage.value.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
