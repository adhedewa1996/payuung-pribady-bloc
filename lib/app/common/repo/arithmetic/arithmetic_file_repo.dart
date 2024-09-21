import 'dart:convert';
import 'dart:io';

import 'package:calculator_camera/app/common/models/arithmetic_model.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:path_provider/path_provider.dart';

class AritmethiFileRepo {
  factory AritmethiFileRepo() {
    return _singleton;
  }
  AritmethiFileRepo._internal();
  static final AritmethiFileRepo _singleton = AritmethiFileRepo._internal();

  Future<String> getFilePath() async {
    var directory = '';
    if (Platform.isIOS) {
      directory = (await getApplicationSupportDirectory()).path;
    } else {
      directory = '/storage/emulated/0/DCIM/satutujuh';
    }
    return directory;
  }

  Future<void> writeToFile(ArithmeticModel data) async {
    final items = await readFromFile();
    items.add(data);

    final toJson = <String, dynamic>{
      'data': List<dynamic>.from(items.map((x) => x.toJson())),
    };

    final directory = await getFilePath();
    final path = '$directory/${FlutterConfig.get('APP_ID')}${FlutterConfig.get('APP_SUFFIX_ID')}/data.json';
    final file = File(path);
    await File(path).create(recursive: true);

    await file.writeAsString(json.encode(toJson));
  }

  Future<List<ArithmeticModel>> readFromFile() async {
    final directory = await getFilePath();
    final path = '$directory/${FlutterConfig.get('APP_ID')}${FlutterConfig.get('APP_SUFFIX_ID')}/data.json';
    final file = File(path);
    if (await file.exists()) {
      final x = await File(path).readAsString();
      final y = json.decode(x);
      final data = List<ArithmeticModel>.from(y['data']!.map((x) => ArithmeticModel.fromJson(x)));
      return data;
    } else {
      return <ArithmeticModel>[];
    }
  }
}
