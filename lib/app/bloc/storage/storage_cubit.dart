import 'dart:developer';

import 'package:calculator_camera/app/bloc/arithmetic/arithmetic_list/arithmetic_list_cubit.dart';
import 'package:calculator_camera/app/common/constants.dart';
import 'package:calculator_camera/app/common/services/permission_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageCubit extends Cubit<UseStorage> {
  StorageCubit() : super(prop);

  static const prop = UseStorage.database;

  Future<void> changeStorage({
    required UseStorage value,
    required BuildContext context,
  }) async {
    log('SIAPA $value');
    if (value == UseStorage.file) {
      if (await Permission.manageExternalStorage.isGranted) {
        emit(value);
      } else {
        await PermissionServices.storagePermission().whenComplete(() async {
          if (await Permission.manageExternalStorage.isGranted) {
            emit(value);
          } else {
            log('MANAGE EXTERNAL STORAGE NEEDED, Please allow to use this features');
          }
        });
      }
    } else {
      emit(value);
    }
    context.read<ArithmeticListCubit>().init(context);
  }

  void refresh() {
    log('REFRESH');
    emit(state);
  }
}
