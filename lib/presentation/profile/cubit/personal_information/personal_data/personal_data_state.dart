part of 'personal_data_cubit.dart';

@freezed
class PersonalDataState with _$PersonalDataState {
  const factory PersonalDataState.initial() = _Initial;
  const factory PersonalDataState.loading() = _Loading;
  const factory PersonalDataState.empty() = _Empty;
  const factory PersonalDataState.success({
    InformationDataModel? informationDataModel,
    int? activeStep,
  }) = _Success;
  const factory PersonalDataState.error(String errorMessage) = _Error;
}
