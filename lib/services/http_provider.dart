import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../core/index.dart';

class HttpProvider with CacheManager {
  final Dio httpClient;

  HttpProvider({required this.httpClient});

  Future<Response> doPost(String url, dynamic data) {
    var endpoint = dotenv.env['BASEURL'].toString() + url;
    return httpClient.post(
      endpoint,
      data: data,
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
  }

  Future<Response> doPostWithToken1(String url, dynamic token, dynamic data) {
    var endpoint = dotenv.env['BASEURL'].toString() + url;
    httpClient.options.headers['Authorization'] = 'Bearer $token';
    return httpClient.post(
      endpoint,
      data: data,
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
  }

  Future<Response> doPostWithToken(String url, dynamic token, dynamic data) {
    var endpoint = dotenv.env['BASEURL'].toString() + url;
    httpClient.options.headers['Authorization'] = 'Bearer $token';
    Map<String, dynamic> requestBody = {
      "classroomId": data,
    };
    return httpClient.post(
      endpoint,
      data: requestBody,
    );
  }

  Future<Response> doGetWithToken(String url, dynamic token) {
    var endpoint = dotenv.env['BASEURL'].toString() + url;
    httpClient.options.headers['Authorization'] = 'Bearer $token';
    return httpClient.get(
      endpoint,
    );
  }

  Future<Response> doPostFile(String url, dynamic data) {
    var endpoint = dotenv.env['BASEURL'].toString() + url;
    return httpClient.post(
      endpoint,
      data: data,
    );
  }
}
