import 'package:check_in/modules/document/controllers/document_controller.dart';
import 'package:flutter/material.dart';
import 'package:check_in/models/document/document.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../global_styles/global_styles.dart';

class DocumentView extends GetView<DocumentController> {
  DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentController>(
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
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors.lightBlack.withOpacity(0.7),
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
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black,
                                        blurRadius: 2,
                                        blurStyle: BlurStyle.outer,
                                        offset: Offset(0, 0),
                                      )
                                    ]),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 25,
                                  child: Text(
                                      "${controller.userData['name'].toString().substring(0, 1)}",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${controller.userData['fullname']}",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                Text("${controller.userData['code']}",
                                    style: TextStyle(color: Colors.black45))
                              ],
                            )
                          ],
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: controller.documents.isEmpty
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount: controller.documents.length,
                                  itemBuilder: (context, index) {
                                    final Document document =
                                        controller.documents[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        padding: GlobalStyles
                                            .paddingPageLeftRight_25,
                                        decoration: BoxDecoration(
                                          color: AppColors.lightWhite
                                              .withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.black,
                                              blurRadius: 2,
                                              blurStyle: BlurStyle.outer,
                                              offset: Offset(
                                                  0, 0), // Shadow position
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
                                        child: ListTile(
                                          title: Text(
                                            '${document.fileName}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          subtitle: Text(
                                              ' Id :${document.classroomId.toString()}',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          trailing: Text(
                                              'document : ${document.id.toString()}',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  },
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
