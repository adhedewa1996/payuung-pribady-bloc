import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';

part 'personal_data_state.dart';
part 'personal_data_cubit.freezed.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataState.initial());

  Future<void> init() async {
    PersonalDataState.initial();
    try {
      final data = Hive.box<InformationDataModel>('PersonalInformationModel').values.toList();
      if (data.isEmpty) {
        emit(
          PersonalDataState.success(
            informationDataModel: InformationDataModel(),
            activeStep: 0,
          ),
        );
      } else {
        emit(
          PersonalDataState.success(
            informationDataModel: data.first,
            activeStep: 0,
          ),
        );
      }
    } catch (e) {}
  }

  void changePage(int value) {
    try {
      emit(PersonalDataState.success(activeStep: value));
    } catch (e) {
      log('BABI $e');
    }
  }
}
