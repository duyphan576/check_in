import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';
import '../models/grade_models.dart';

class GradeProvider extends GetConnect {
  GradeProvider({required this.http});

  final HttpProvider http;
  Future<BaseResponse?> grade(GradeModel gradeModel, url, token) async {
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

  Future<BaseResponse?> seen(Map<String, dynamic> id, url, token) async {
    return await http.doPostWithToken(url, token, id).then((response) {
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
