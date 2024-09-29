import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:payuung_pribadi_app/common/helpers/dummy_helper.dart';
import 'package:payuung_pribadi_app/common/models/wellness_model.dart';
import 'package:payuung_pribadi_app/data/repo/wellness_database.dart';

part 'wellness_state.dart';
part 'wellness_cubit.freezed.dart';

class WellnessCubit extends Cubit<WellnessState> {
  WellnessCubit() : super(WellnessState.initial());

  Future<void> fetchWellness() async {
    try {
      final data = Hive.box<WellnewssItem>('WellnewssItem').values.toList();
      if (data.isEmpty) {
        // IF EMPTY SAVE DUMMY TO DATABASE LOCAL
        for (final item in DummyHelper.exploreWellness) {
          await WellnessRepo().add(item);
          emit(WellnessState.success(DummyHelper.exploreWellness, 'Terpopuler'));
        }
      } else {
        emit(WellnessState.success(DummyHelper.exploreWellness, 'Terpopuler'));
      }
    } catch (e) {
      log('fetchWellnewss Catch $e');
    }
  }
}
