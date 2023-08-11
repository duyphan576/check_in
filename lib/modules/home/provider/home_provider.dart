import 'package:check_in/modules/home/models/home_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class HomeProvider extends GetConnect {
  HomeProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> home(HomeModel homeModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(homeModel.toMap());

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

  Future<BaseResponse?> getUnreadMessage(
      HomeModel homeModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    // submit.addAll(_defaultBody);
    submit.addAll(homeModel.toMap());

    return await http.doPost("", submit).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          statusText: response.statusMessage,
          status: response.data['error'],
          data: response.data['data'] ?? {},
          message:
              response.data['message'] != null ? response.data['message'] : "");
    }).catchError((onError) {
      return BaseResponse(statusText: onError.toString(), statusCode: 400);
    });
  }
}
