import 'package:calculator_camera/app/common/models/arithmetic_model.dart';
import 'package:hive/hive.dart';

class AritmethicRepo {
  factory AritmethicRepo() {
    return _singleton;
  }
  AritmethicRepo._internal();
  static final AritmethicRepo _singleton = AritmethicRepo._internal();

  final Box<ArithmeticModel> _aritmethicBox = Hive.box<ArithmeticModel>('ListArithmeticModel');

  Future<void> addAritmethic(ArithmeticModel aritmethic) async {
    await _aritmethicBox.add(aritmethic);
  }

  ArithmeticModel? getAritmethic(int index) {
    return _aritmethicBox.getAt(index);
  }

  Future<void> updateAritmethic(int index, ArithmeticModel aritmethic) async {
    await _aritmethicBox.putAt(index, aritmethic);
  }

  Future<void> deleteAritmethic(int index) async {
    await _aritmethicBox.deleteAt(index);
  }

  List<ArithmeticModel> getAllAritmethics() {
    return _aritmethicBox.values.toList();
  }

  Box? box() {
    return _aritmethicBox;
  }
}
