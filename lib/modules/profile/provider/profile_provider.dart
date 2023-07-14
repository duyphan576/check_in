import 'package:check_in/services/http_provider.dart';
import 'package:get/get.dart';

import '../../../core/base_response.dart';
import '../models/profile_model.dart';

class ProfileProvider extends GetConnect {
  Map<String, dynamic> _defaultBody = {
    // 'app_key': dotenv.env['APPKEY'],
    // 'op': dotenv.env['OPTION'],
    // 'ver': dotenv.env['VER'],
  };

  ProfileProvider({required this.http});

  final HttpProvider http;

  Future<BaseResponse?> getConfig(ProfileModel profileModel) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(_defaultBody);
    submit.addAll(profileModel.toMap());
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

  Future<BaseResponse?> getLang(ProfileModel profileModel) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(_defaultBody);
    submit.addAll(profileModel.toMap());
    return await http.doPost("", submit).then((response) {
      return BaseResponse(
          statusCode: response.statusCode,
          statusText: response.statusMessage,
          status: response.data['error'],
          data: response.data['data'] ?? {},
          message: response.data != null && response.data['message'] != null
              ? response.data['message'].toString()
              : "",
          lang: response.data != null
              ? Map<String, dynamic>.from(response.data)
              : {});
    }).catchError((onError) {
      return BaseResponse(statusText: onError.toString(), statusCode: 400);
    });
  }

  Future<BaseResponse?> getInfoUser(ProfileModel profileModel) async {
    Map<String, dynamic> submit = Map<String, dynamic>();
    submit.addAll(_defaultBody);
    submit.addAll(profileModel.toMap());
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
