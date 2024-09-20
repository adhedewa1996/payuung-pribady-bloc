import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';

class NetworkClient {
  factory NetworkClient() {
    return _instance;
  }

  NetworkClient._();

  static final Dio _dio = Dio()..options.connectTimeout = Duration(seconds: 30);

  static String baseurl = FlutterConfig.get('BASE_URL');

  static final NetworkClient _instance = NetworkClient._();

  static Future<Response> get({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? customHeader,
    @required String? path,
    bool showApi = false,
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.get(
      (url ?? baseurl) + path!,
      queryParameters: data,
      cancelToken: cancelToken,
    );

    if (showApi) {
      log('--------------------------------------');
      log('CALLING GET ${res.requestOptions.path}');
      log('Query GET ${res.requestOptions.queryParameters}');
      log('Data Response ${res.data}');
      log('--------------------------------------');
    }

    return res;
  }
}
