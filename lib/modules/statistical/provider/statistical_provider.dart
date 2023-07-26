import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/statistical/models/statistical_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class StatisticalProvider extends GetConnect {
  StatisticalProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> statistical(
      StatisticalModel statisticalModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(statisticalModel.toMap());

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
