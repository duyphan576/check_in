import 'package:check_in/modules/forgot_password/models/forgot_password_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class ForgotPasswordProvider extends GetConnect {
  ForgotPasswordProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> forgotPassword(
      ForgotPasswordModel forgotPasswordModel, url) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(forgotPasswordModel.toMap());
    return await http.doPost(url, submit).then((response) {
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
