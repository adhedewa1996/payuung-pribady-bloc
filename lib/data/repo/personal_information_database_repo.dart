import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';

class PersonalInformationRepo {
  factory PersonalInformationRepo() {
    return _singleton;
  }
  PersonalInformationRepo._internal();
  static final PersonalInformationRepo _singleton = PersonalInformationRepo._internal();

  final Box<InformationDataModel> _box = Hive.box<InformationDataModel>('PersonalInformationModel');

  Future<void> add(InformationDataModel data) async {
    await _box.add(data);
  }

  InformationDataModel? get(int index) {
    return _box.getAt(index);
  }

  Future<void> update(int index, InformationDataModel data) async {
    await _box.putAt(index, data);
  }

  Future<void> delete(int index) async {
    await _box.deleteAt(index);
  }

  List<InformationDataModel> getAll() {
    return _box.values.toList();
  }

  Box? box() {
    return _box;
  }

  Future<String> getFilePath() async {
    var directory = '';
    if (Platform.isIOS) {
      directory = (await getApplicationSupportDirectory()).path;
    } else {
      directory = '/storage/emulated/0/DCIM/payuung_pribadi_app_adhe';
    }
    return directory;
  }
}
