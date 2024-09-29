part of 'bottom_navigation_cubit.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState.initial() = _Initial;
  const factory BottomNavigationState.loading() = _Loading;
  const factory BottomNavigationState.empty() = _Empty;
  const factory BottomNavigationState.success(
    int selected,
  ) = _Success;
  const factory BottomNavigationState.error(String errorMessage) = _Error;
}
