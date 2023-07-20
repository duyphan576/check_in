import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/global_widgets/inkwell_custom.dart';
import 'package:check_in/global_widgets/left_drawer.dart';
import 'package:check_in/global_widgets/student_data.dart';
import 'package:check_in/modules/home/controllers/home_controller.dart';
import 'package:check_in/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
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
                      drawer: LeftDrawer(),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: GlobalStyles.paddingPageLeftRight_25,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.lightWhite.withOpacity(0.7),
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
                                    child: Padding(
                                      padding:
                                          GlobalStyles.paddingPageLeftRight_25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          StudentPicture(
                                            name: controller.userData["name"],
                                          ),
                                          GlobalStyles.sizedBoxWidth,
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GlobalStyles.sizedBoxHeight_25,
                                              StudentName(
                                                studentName: controller
                                                    .userData["fullname"],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: AppColors.lightWhite,
                                                ),
                                              ),
                                              StudentCode(
                                                code: controller
                                                    .userData!["code"]
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GlobalStyles.sizedBoxHeight,
                                Padding(
                                  padding: GlobalStyles.paddingPageLeftRight_25,
                                  child: Column(
                                    children: [
                                      InkWellCustom(
                                        function: () {},
                                        text: HomeString.CHECK_IN,
                                        icon: Icons.check,
                                        subText: '',
                                      ),
                                      GlobalStyles.sizedBoxHeight,
                                      InkWellCustom(
                                        function: () {
                                          Get.toNamed(Routes.CLASSROOM);
                                        },
                                        text: HomeString.CLASSROOM,
                                        icon: Icons.class_,
                                        subText: '',
                                      ),
                                      GlobalStyles.sizedBoxHeight,
                                      InkWellCustom(
                                        function: () {
                                          Get.toNamed(Routes.GRADE);
                                        },
                                        text: HomeString.GRADE,
                                        icon: Icons.grade,
                                        subText: '',
                                      ),
                                      GlobalStyles.sizedBoxHeight,
                                      InkWellCustom(
                                        function: () {},
                                        text: HomeString.DOCUMENT,
                                        icon: Icons.storage,
                                        subText: '',
                                      ),
                                      GlobalStyles.sizedBoxHeight,
                                      InkWellCustom(
                                        function: () {
                                          Get.toNamed(Routes.PROFILE);
                                        },
                                        text: HomeString.PROFILE,
                                        icon: Icons.person,
                                        subText: '',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
