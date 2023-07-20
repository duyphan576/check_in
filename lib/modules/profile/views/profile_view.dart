import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
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
                      body: LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: GlobalStyles.paddingPageLeftRight_25,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
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
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            child: GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.lightWhite
                                                      .withOpacity(0.7),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.black,
                                                      blurRadius: 4,
                                                      blurStyle:
                                                          BlurStyle.outer,
                                                      offset: Offset(0,
                                                          0), // Shadow position
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
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Text(
                                                    controller.userData["name"]
                                                        .substring(0, 1),
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.lightWhite,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GlobalStyles.sizedBoxWidth,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GlobalStyles.sizedBoxHeight_25,
                                              Text(
                                                controller.userData["fullname"],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColors.lightWhite,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                                              Text(
                                                controller.userData["code"]
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.lightWhite,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GlobalStyles.sizedBoxHeight,
                                  Container(
                                    padding: GlobalStyles.paddingAll,
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
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minHeight:
                                              constraints.maxHeight * 0.4),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GlobalStyles.sizedBoxHeight,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ProfileDetailRow(
                                                title: 'Family Mid Name',
                                                value: controller
                                                    .userData["famMidName"],
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              ProfileDetailRow(
                                                title: 'Name',
                                                value:
                                                    controller.userData["name"],
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ProfileDetailRow(
                                                title: 'Gender',
                                                value: controller
                                                    .userData["gender"],
                                              ),
                                              GlobalStyles.sizedBoxHeight,
                                              ProfileDetailRow(
                                                title: 'Birthdate',
                                                value: controller
                                                    .userData["birthdate"],
                                              ),
                                            ],
                                          ),
                                          GlobalStyles.sizedBoxHeight,
                                          Padding(
                                            padding: GlobalStyles.paddingAll,
                                            child: Column(
                                              children: [
                                                ProfileDetailColumn(
                                                  title: 'Email',
                                                  value: controller
                                                      .userData["email"],
                                                ),
                                                GlobalStyles.sizedBoxHeight,
                                                ProfileDetailColumn(
                                                  title: 'Phone Number',
                                                  value: controller
                                                      .userData["phone"],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.lightWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightWhite,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Divider(
                  thickness: 1.0,
                  color: AppColors.lightWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.lightWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GlobalStyles.sizedBoxHeight_10,
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightWhite,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Divider(
                  thickness: 1.0,
                  color: AppColors.lightWhite,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
