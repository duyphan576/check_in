import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/constants/app_images.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.9,
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
                          padding: GlobalStyles.paddingAll,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.lightWhite.withOpacity(0.8),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            'assets/images/student_profile.jpeg'),
                                      ),
                                      GlobalStyles.sizedBoxWidth,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GlobalStyles.sizedBoxHeight,
                                          GlobalStyles.sizedBoxHeight,
                                          Text(
                                            controller.userData["fullname"],
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: AppColors.lightBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Divider(
                                              thickness: 1.0,
                                            ),
                                          ),
                                          Text(
                                            controller.userData["code"]
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: AppColors.lightBlack,
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
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.lightWhite.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.lightWhite.withOpacity(0.8),
                                    )
                                  ],
                                ),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minHeight: constraints.maxHeight * 0.5),
                                  child: Column(
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
                                            value: controller.userData["name"],
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
                                            value:
                                                controller.userData["gender"],
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
                                        padding: GlobalStyles.paddingAll18,
                                        child: Column(
                                          children: [
                                            ProfileDetailColumn(
                                              title: 'Email',
                                              value:
                                                  controller.userData["email"],
                                            ),
                                            GlobalStyles.sizedBoxHeight,
                                            ProfileDetailColumn(
                                              title: 'Phone Number',
                                              value:
                                                  controller.userData["phone"],
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
            ));
    });
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
                  color: AppColors.lightBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GlobalStyles.sizedBoxHeight,
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.lightBlack,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 24,
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
                  color: AppColors.lightBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GlobalStyles.sizedBoxHeight,
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.lightBlack,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.73,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 24,
          ),
        ],
      ),
    );
  }
}
