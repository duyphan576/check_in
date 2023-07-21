import 'package:check_in/modules/checkin/models/checkin_model.dart';
import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';

class CheckinProvider extends GetConnect {
  CheckinProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> checkin(CheckinModel checkinModel, url, token) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(checkinModel.toMap());

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
