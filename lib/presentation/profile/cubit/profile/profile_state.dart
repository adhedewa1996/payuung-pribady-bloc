import 'package:payuung_pribadi_app/common/models/information_data_model.dart';

abstract class ProfileState {
  ProfileState({
    this.informationDataModel,
  });
  final InformationDataModel? informationDataModel;
}

class ProfileSuccessState extends ProfileState {
  ProfileSuccessState({
    this.informationDataModel,
  });
  final InformationDataModel? informationDataModel;
}
