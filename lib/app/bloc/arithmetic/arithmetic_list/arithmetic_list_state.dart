part of 'arithmetic_list_cubit.dart';

@freezed
class ArithmeticState with _$ArithmeticState {
  const factory ArithmeticState.initial() = _Initial;
  const factory ArithmeticState.loading() = _Loading;
  const factory ArithmeticState.empty() = _Empty;
  const factory ArithmeticState.success(List<ArithmeticModel> list) = _Success;
  const factory ArithmeticState.error(String errorMessage) = _Error;
}
