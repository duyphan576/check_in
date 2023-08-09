import 'package:check_in/constants/index.dart';
import 'package:check_in/modules/detail/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<DetailController>
    implements PreferredSizeWidget {
  final double height;

  CustomAppBar({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            // color: AppColors.lightWhite,
            image: DecorationImage(
              image: AssetImage(
                AppImages.bg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: ListTile(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.lightWhite,
              ),
              onPressed: () => Get.back(),
            ),
            title: Center(
              child: Text(
                controller.classroom!.term!.termName!,
                style: TextStyle(
                  color: AppColors.lightWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    controller.goToStatistical(
                      controller.classroom!.id.toString(),
                    );
                  },
                  icon: Icon(
                    Icons.pie_chart,
                    size: 28,
                    color: AppColors.lightWhite,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     controller.showInfo(
                //       controller.classroom!,
                //     );
                //   },
                //   icon: Icon(
                //     Icons.info_outline_rounded,
                //     size: 28,
                //     color: AppColors.lightWhite,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Container(),
        Positioned(
          top: 70,
          width: MediaQuery.of(context).size.width,
          child: AppBar(
            backgroundColor: AppColors.lightWhite,
            automaticallyImplyLeading: false,
            titleSpacing: 1,
            elevation: 0.0,
            title: TabBar(
              labelColor: AppColors.lightWhite,
              unselectedLabelColor: AppColors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
              indicatorWeight: 2,
              indicatorColor: AppColors.red,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(4),
              indicator: ShapeDecoration(
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                color: AppColors.subMain,
              ),
              enableFeedback: true,
              controller: controller.tabController,
              tabs: <Widget>[
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      DetailString.CLASS_INFO,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      DetailString.STUDENT,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      DetailString.DOCUMENT,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
