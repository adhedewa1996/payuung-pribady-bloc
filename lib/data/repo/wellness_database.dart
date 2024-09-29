import 'package:hive/hive.dart';
import 'package:payuung_pribadi_app/common/models/wellness_model.dart';

class WellnessRepo {
  factory WellnessRepo() {
    return _singleton;
  }
  WellnessRepo._internal();
  static final WellnessRepo _singleton = WellnessRepo._internal();

  final Box<WellnewssItem> _box = Hive.box<WellnewssItem>('WellnewssItem');

  Future<void> add(WellnewssItem data) async {
    await _box.add(data);
  }

  WellnewssItem? get(int index) {
    return _box.getAt(index);
  }

  Future<void> update(int index, WellnewssItem data) async {
    await _box.putAt(index, data);
  }

  Future<void> delete(int index) async {
    await _box.deleteAt(index);
  }

  List<WellnewssItem> getAll() {
    return _box.values.toList();
  }

  Box? box() {
    return _box;
  }
}
