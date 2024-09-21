import 'package:calculator_camera/app/common/models/arithmetic_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ArithmeticModelAdapter());
    await Hive.openBox<ArithmeticModel>('ListArithmeticModel');
  }
}
