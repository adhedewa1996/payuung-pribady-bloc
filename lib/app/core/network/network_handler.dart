import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'network.dart';

ResultApi resultHandler({
  required Response<dynamic> network,
}) {
  if (isSuccess(network.statusCode ?? 500)) {
    return Success(resultToMap(network.data));
  }
  if (isClientError(network.statusCode ?? 0)) {
    return Failure(
      exception: Exception('Client Error ${network.statusMessage}'),
      statusCode: network.statusCode ?? 0,
    );
  }
  if (isServerError(network.statusCode ?? 0)) {
    return Failure(
      exception: Exception('Server Error ${network.statusMessage}'),
      statusCode: network.statusCode ?? 0,
    );
  }
  return Failure(
    exception: Exception('Some error occurred ${network.statusMessage}'),
    statusCode: network.statusCode ?? 0,
  );
}

void errorCatch(DioException e) {
  if (e.response != null) {
    debugPrint('Error Calling ${e.requestOptions.path}');
    debugPrint('Error Status Code ${e.response!.statusCode}');
    debugPrint('Error Response ${e.response!.data}');
  } else {
    debugPrint('Error CALLING ${e.requestOptions}');
    debugPrint('Error Message ${e.message}');
  }
}

Map<String, dynamic> resultToMap(dynamic data) {
  final Map<String, dynamic> convert = data;
  return convert;
}
