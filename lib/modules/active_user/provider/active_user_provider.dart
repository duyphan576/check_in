import 'package:check_in/modules/active_user/models/active_user_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class ActiveUserProvider extends GetConnect {
  ActiveUserProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> activeUser(ActiveUserModel activeUserModel, url) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(activeUserModel.toMap());
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
