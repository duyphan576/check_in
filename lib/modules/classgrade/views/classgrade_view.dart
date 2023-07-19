import 'package:check_in/constants/index.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:check_in/modules/classgrade/controllers/classgrade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassgradeView extends GetView<ClassgradeController> {
  const ClassgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassgradeController>(
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
                      //   body: SingleChildScrollView(
                      //     child: Container(
                      //       height: MediaQuery.of(context).size.height,
                      //       width: MediaQuery.of(context).size.width,
                      //       child: StreamBuilder<List<Classgrade>>(
                      //         stream: controller.getStreamOfData(),
                      //         builder: (context, snapshot) {
                      //           if (snapshot.hasData) {
                      //             final List<Classgrade>? classgrades =
                      //                 snapshot.data;
                      //             return ListView.builder(
                      //               padding: GlobalStyles.paddingPageLeftRight_25,
                      //               itemCount: classgrades?.length ?? 0,
                      //               itemBuilder: (context, index) {
                      //                 final Classgrade classgrade =
                      //                     classgrades![index];
                      //                 return Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.center,
                      //                   children: [
                      //                     Container(
                      //                       padding: GlobalStyles
                      //                           .paddingPageLeftRight_25,
                      //                       decoration: BoxDecoration(
                      //                         color: AppColors.lightWhite
                      //                             .withOpacity(0.7),
                      //                         borderRadius:
                      //                             BorderRadius.circular(8),
                      //                         boxShadow: [
                      //                           BoxShadow(
                      //                             color: AppColors.black,
                      //                             blurRadius: 4,
                      //                             blurStyle: BlurStyle.outer,
                      //                             offset: Offset(
                      //                                 0, 0), // Shadow position
                      //                           ),
                      //                         ],
                      //                         gradient: LinearGradient(
                      //                           colors: [
                      //                             Color(0xFF41D8D7),
                      //                             Color(0xFF21A3C6),
                      //                             Color(0xFF285DA2),
                      //                             Color(0xFF332F61),
                      //                             Color(0xFF452E51),
                      //                           ],
                      //                           begin: Alignment.bottomLeft,
                      //                           end: Alignment.topRight,
                      //                         ),
                      //                       ),
                      //                       child: InkWell(
                      //                         onTap: () {},
                      //                         child: ListTile(
                      //                           title: Text(
                      //                             classgrade.term.termName,
                      //                             style: TextStyle(
                      //                               color: AppColors.lightWhite,
                      //                               fontSize: 18,
                      //                               fontWeight: FontWeight.bold,
                      //                             ),
                      //                           ),
                      //                           subtitle: Text(
                      //                             classgrade.lecturer.fullname,
                      //                             style: TextStyle(
                      //                               color: AppColors.lightWhite,
                      //                               fontSize: 14,
                      //                             ),
                      //                           ),
                      //                           trailing: Text(
                      //                             'Credit: ${classgrade.term.credit}',
                      //                             style: TextStyle(
                      //                               color: AppColors.lightWhite,
                      //                               fontSize: 14,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     GlobalStyles.sizedBoxHeight,
                      //                   ],
                      //                 );
                      //               },
                      //             );
                      //           } else if (snapshot.hasError) {
                      //             return Text('Error: ${snapshot.error}');
                      //           } else {
                      //             return Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment: CrossAxisAlignment.center,
                      //               children: [
                      //                 CircularProgressIndicator(
                      //                   color: AppColors.main,
                      //                 ),
                      //               ],
                      //             );
                      //           }
                      //         },
                      //       ),
                      //     ),
                      //   ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
