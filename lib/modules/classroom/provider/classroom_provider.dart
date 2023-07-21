import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/classroom/models/classroom_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class ClassroomProvider extends GetConnect {
  ClassroomProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> classroom(
      ClassroomModel classroomModel, url, token) async {
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

  Future<BaseResponse?> detail(String classroomId, url, token) async {
    return await http.doPostWithToken(url, token, classroomId).then((response) {
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
