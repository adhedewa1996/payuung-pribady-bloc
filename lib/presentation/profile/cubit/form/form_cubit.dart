import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payuung_pribadi_app/common/helpers/string_extensions.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';
import 'package:payuung_pribadi_app/data/repo/personal_information_database_repo.dart';
import 'package:uuid/uuid.dart';

part 'form_state.dart';

class PersonalFormCubit extends Cubit<PersonalFormState> {
  PersonalFormCubit() : super(FormUpdateState());

  Future<void> init() async {
    try {
      final data = Hive.box<InformationDataModel>('PersonalInformationModel').values.toList();
      if (data.isEmpty) {
        emit(
          state.copyWith(
            informationDataModel: InformationDataModel(),
          ),
        );
      } else {
        emit(
          state.copyWith(
            informationDataModel: data.first,
          ),
        );
      }
    } catch (e) {}
  }

  Future<void> updatePersonalData({
    PersonalData? data,
  }) async {
    final save = InformationDataModel(
      personalData: data,
      personalAddress: state.informationDataModel?.personalAddress,
      companyInformation: state.informationDataModel?.companyInformation,
    );
    emit(
      state.copyWith(
        informationDataModel: save,
      ),
    );

    final model = PersonalInformationRepo().getAll();
    if (model.isEmpty) {
      await PersonalInformationRepo().add(save);
    } else {
      await PersonalInformationRepo().update(0, save);
    }
  }

  Future<void> updatePersonalAddress({
    PersonalAddress? data,
  }) async {
    final save = InformationDataModel(
      personalData: state.informationDataModel?.personalData,
      personalAddress: data,
      companyInformation: state.informationDataModel?.companyInformation,
    );
    emit(
      state.copyWith(informationDataModel: save),
    );

    final model = PersonalInformationRepo().getAll();
    if (model.isEmpty) {
      await PersonalInformationRepo().add(save);
    } else {
      await PersonalInformationRepo().update(0, save);
    }
  }

  Future<void> updateCompanyInformation({
    CompanyInformation? data,
  }) async {
    final save = InformationDataModel(
      personalData: state.informationDataModel?.personalData,
      personalAddress: state.informationDataModel?.personalAddress,
      companyInformation: data,
    );
    emit(
      state.copyWith(informationDataModel: save),
    );

    final model = PersonalInformationRepo().getAll();
    if (model.isEmpty) {
      await PersonalInformationRepo().add(save);
    } else {
      await PersonalInformationRepo().update(0, save);
    }
  }

  Future<void> cameraRoll({
    required BuildContext context,
    required Function(String) callback,
  }) async {
    final picker = ImagePicker();
    final media = await picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      await saveImage(
        image: media.path,
        context: context,
        callback: (value) {
          callback.call(value);
        },
      );
      Navigator.pop(context);
    } else {}
  }

  Future<void> buildInCamera({
    required BuildContext context,
    required Function(String) callback,
  }) async {
    final picker = ImagePicker();
    final media = await picker.pickImage(source: ImageSource.camera);
    if (media != null) {
      await saveImage(
        image: media.path,
        context: context,
        callback: (value) {
          callback.call(value);
        },
      );
      Navigator.pop(context);
    } else {}
  }

  Future<void> saveImage({
    required String image,
    required BuildContext context,
    required Function(String) callback,
  }) async {
    try {
      final captureImage = File(image).readAsBytesSync();
      final directory = await PersonalInformationRepo().getFilePath();
      final path = '$directory/KTP-${const Uuid().v1()}.png';
      callback.call(path);
      final imagePath = await File(path).create(recursive: true);
      await imagePath.writeAsBytes(captureImage);
      'KTP Berhasil disimpan'.snackbar(context);
    } catch (e) {}
  }
}
