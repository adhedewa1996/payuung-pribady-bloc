import 'package:dio/dio.dart';
import 'network_client.dart';
import 'network_handler.dart';
import 'network_seal.dart';

// IMPLEMENTATION FOR CALL AN API
Future<ResultApi> callApi({
  String? url,
  required String path,
  Map<String, dynamic>? data,
  Map<String, dynamic>? customHeader,
  bool showApi = false,
}) async {
  try {
    final network = await NetworkClient.get(
      url: url,
      path: path,
      data: data,
      customHeader: customHeader,
      showApi: showApi,
    );
    return resultHandler(network: network);
  } on DioException catch (e) {
    errorCatch(e);
    return Failure(
      exception: e,
      statusCode: e.response?.statusCode ?? 0,
    );
  } on Exception catch (e) {
    return Failure(exception: e, statusCode: 0);
  }
}

// IMPLEMENTATION FOR CALLING A SINGLE API
Future<void> singleApi({
  required Function() repo,
  required Function() progressOnInitAndRecall,
  required Function(ResultApi result) result,
}) async {
  progressOnInitAndRecall.call();
  await Future.delayed(Duration(seconds: 2));
  final res = await repo.call();
  await result.call(res);
}
