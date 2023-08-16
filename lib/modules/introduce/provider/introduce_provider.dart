import 'package:check_in/modules/introduce/models/introduce_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class IntroduceProvider extends GetConnect {
  IntroduceProvider({required this.http});

  final HttpProvider http;
  Future<BaseResponse?> introduce(
      IntroduceModel introduceModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(introduceModel.toMap());
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
}
