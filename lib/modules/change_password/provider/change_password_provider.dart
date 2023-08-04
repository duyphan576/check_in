import 'package:check_in/modules/change_password/models/change_password_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class ChangePasswordProvider extends GetConnect {
  ChangePasswordProvider({required this.http});

  final HttpProvider http;
  Future<BaseResponse?> changePassword(
      ChangePasswordModel changePasswordModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(changePasswordModel.toMap());
    return await http.doPostWithToken(url, token, submit).then((response) {
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

  Future<BaseResponse?> logout(
      ChangePasswordModel changePasswordModel, url, token) async {
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
