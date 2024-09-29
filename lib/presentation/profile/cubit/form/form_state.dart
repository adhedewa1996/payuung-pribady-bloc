part of 'form_cubit.dart';

abstract class PersonalFormState {
  PersonalFormState({
    this.informationDataModel,
  });

  final InformationDataModel? informationDataModel;

  PersonalFormState copyWith({
    InformationDataModel? informationDataModel,
  });
}

class FormUpdateState extends PersonalFormState {
  FormUpdateState({
    this.informationDataModel,
  }) : super(informationDataModel: informationDataModel);

  final InformationDataModel? informationDataModel;

  @override
  PersonalFormState copyWith({InformationDataModel? informationDataModel}) {
    return FormUpdateState(informationDataModel: informationDataModel);
  }
}
