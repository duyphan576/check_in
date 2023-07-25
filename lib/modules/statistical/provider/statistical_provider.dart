import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/detail/models/detail_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

class DetailProvider extends GetConnect {
  DetailProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> detail(DetailModel detailModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(detailModel.toMap());

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
