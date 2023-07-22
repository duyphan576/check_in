import 'package:check_in/modules/profile/models/profile_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class ProfileProvider extends GetConnect {
  ProfileProvider({required this.http});

  final HttpProvider http;
  Future<BaseResponse?> changePassord(
      ProfileModel profileModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(profileModel.toMap());
    return await http.doPostWithToken1(url, token, submit).then((response) {
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
