import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';
import 'package:payuung_pribadi_app/common/models/wellness_model.dart';

class LocalStorageServices {
  static Future<void> init() async {
    await initHive();
    await initHydratedBloc();
  }

  static Future<void> initHydratedBloc() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
    );
  }

  static Future<void> initHive() async {
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
