import 'package:check_in/modules/qr/controllers/qr_controller.dart';
import 'package:check_in/modules/qr/provider/qr_provider.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../repository/qr_repository.dart';

class QrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrProvider(http: HttpProvider(httpClient: Dio())));
    Get.lazyPut(() => QrRepository(qrProvider: Get.find<QrProvider>()));

    Get.put(QrController(
      qrRepository: Get.find<QrRepository>(),
    ));
  }
}
