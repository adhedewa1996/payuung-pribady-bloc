import 'dart:convert';

import 'package:hive/hive.dart';

part 'arithmetic_model.g.dart';

@HiveType(typeId: 0)
class ArithmeticModel extends HiveObject {
  ArithmeticModel({
    required this.imagePath,
    required this.uint8List,
    required this.inputFromMlKit,
    required this.result,
    required this.from,
  });

  factory ArithmeticModel.fromJson(Map<String, dynamic> json) => ArithmeticModel(
        imagePath: json['image_path'],
        uint8List: json['uint_8_list'],
        inputFromMlKit: json['input_from_ml_kit'],
        result: json['result'],
        from: json['from'],
      );

  factory ArithmeticModel.fromRawJson(String str) => ArithmeticModel.fromJson(json.decode(str));

  String toRawJson(Future<String> file) => json.encode(toJson());

  @HiveField(0)
  String? imagePath;
  @HiveField(1)
  String? uint8List;
  @HiveField(2)
  String? inputFromMlKit;
  @HiveField(3)
  String? result;
  @HiveField(4)
  String? from;

  Map<String, dynamic> toJson() => {
        'image_path': imagePath,
        'uint_8_list': uint8List,
        'input_from_ml_kit': inputFromMlKit,
        'result': result,
        'from': from,
      };
}
