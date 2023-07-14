import 'package:check_in/modules/login/models/login_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class LoginProvider extends GetConnect {
  LoginProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> login(LoginModel loginModel, url) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(loginModel.toMap());
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
