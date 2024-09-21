import 'dart:developer';

import 'package:calculator_camera/app/bloc/storage/storage_cubit.dart';
import 'package:calculator_camera/app/common/constants.dart';
import 'package:calculator_camera/app/common/models/arithmetic_model.dart';
import 'package:calculator_camera/app/common/repo/arithmetic/arithmetic_file_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'arithmetic_list_state.dart';
part 'arithmetic_list_cubit.freezed.dart';

class ArithmeticListCubit extends Cubit<ArithmeticState> {
  ArithmeticListCubit() : super(const ArithmeticState.initial());

  Future<void> init(BuildContext context) async {
    if (context.read<StorageCubit>().state == UseStorage.file) {
      await callFileStorage();
    } else {
      await callDatabaseStorage();
    }
  }

  Future<void> callFileStorage() async {
    try {
      final data = await AritmethiFileRepo().readFromFile();
      if (data.isEmpty) {
        emit(ArithmeticState.empty());
      } else {
        emit(ArithmeticState.success(data));
      }
    } catch (e) {
      log('CATCH callFileStorage $e');
    }
  }

  Future<void> callDatabaseStorage() async {
    try {
      final data = Hive.box<ArithmeticModel>('ListArithmeticModel').values.toList();
      if (data.isEmpty) {
        emit(ArithmeticState.empty());
      } else {
        emit(ArithmeticState.success(data));
      }
    } catch (e) {
      log('CATCH callFileStorage $e');
    }
  }
}
