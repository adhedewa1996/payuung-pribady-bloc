import 'package:example/app/core/network/network_implementation.dart';
import 'package:example/app/core/network/network_seal.dart';

mixin HomeRepository {
  Future<ResultApi> repoGetHeadline() async {
    final res = await callApi(
      path: '/mobile_breaking_mix_nocontent/16/5/0',
    );
    return res;
  }
}
