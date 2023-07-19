import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/classgrade/models/classgrade_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class ClassgradeProvider extends GetConnect {
  ClassgradeProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> classgrade(
      ClassgradeModel classgradeModel, url, token) async {
    // Map<String, dynamic> submit = Map<String, dynamic>();
    // submit.addAll(classgradeModel.toMap());

    return await http.doGetWithToken(url, token).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          statusText: response.statusMessage,
          status: response.data['success'],
          data: response.data['data'] ?? {},
          message:
              response.data['message'] != null ? response.data['message'] : "");
    }).catchError((onError) {
      return BaseResponse(statusText: onError.toString(), statusCode: 400);
    });
  }
}
