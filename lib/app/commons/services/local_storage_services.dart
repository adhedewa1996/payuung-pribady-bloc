import 'package:hive_flutter/hive_flutter.dart';
import 'package:payuung_pribadi_app/app/commons/models/information_data_model.dart';
import 'package:payuung_pribadi_app/app/commons/models/wellness_model.dart';

class LocalStorageServices {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(InformationDataModelAdapter());
    Hive.registerAdapter(PersonalDataAdapter());
    Hive.registerAdapter(PersonalAddressAdapter());
    Hive.registerAdapter(CompanyInformationAdapter());
    Hive.registerAdapter(WellnewssItemAdapter());
    await Hive.openBox<InformationDataModel>('PersonalInformationModel');
    await Hive.openBox<WellnewssItem>('WellnewssItem');
  }
}
