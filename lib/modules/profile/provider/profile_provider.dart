import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/profile/models/profile_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class ProfileProvider extends GetConnect {
  ProfileProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> profile(Map<String, dynamic> data, url, token) async {
    return await http.doPostWithToken(url, token, data).then((response) {
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
