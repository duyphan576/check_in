import 'package:check_in/core/index.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class CheckinProvider extends GetConnect {
  CheckinProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> checkin(Map<String, dynamic> wifi, url, token) async {
    return await http.doPostWithToken(url, token, wifi).then((response) {
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

  Future<BaseResponse?> history(url, token) async {
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
