import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_state.dart';
part 'bottom_navigation_cubit.freezed.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState.initial());

  Future<void> init() async {
    emit(BottomNavigationState.success(0));
  }

  void changeIndex(int value) {
    log('changeIndex');
    try {
      emit(BottomNavigationState.success(value));
    } catch (e) {
      log('catch $e');
    }
  }
}
