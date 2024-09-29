part of 'wellness_cubit.dart';

@freezed
class WellnessState with _$WellnessState {
  const factory WellnessState.initial() = _Initial;
  const factory WellnessState.loading() = _Loading;
  const factory WellnessState.empty() = _Empty;
  const factory WellnessState.success(
    List<WellnewssItem> list,
    String selectedFilter,
  ) = _Success;
  const factory WellnessState.error(String errorMessage) = _Error;
}
