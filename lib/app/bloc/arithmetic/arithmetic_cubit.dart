import 'dart:developer';
import 'dart:io';

import 'package:calculator_camera/app/bloc/arithmetic/arithmetic_list/arithmetic_list_cubit.dart';
import 'package:calculator_camera/app/bloc/storage/storage_cubit.dart';
import 'package:calculator_camera/app/common/constants.dart';
import 'package:calculator_camera/app/common/models/arithmetic_model.dart';
import 'package:calculator_camera/app/common/repo/arithmetic/arithmetic_database_repo.dart';
import 'package:calculator_camera/app/common/repo/arithmetic/arithmetic_file_repo.dart';
import 'package:calculator_camera/app/common/extentions/string_ext.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ArithmeticCubit extends Cubit<XFile?> {
  ArithmeticCubit() : super(prop);

  static XFile prop = XFile('');

  Future<void> captureArithmeticFrom(BuildContext context) async {
    if (useCameraRoll()) {
      await cameraRoll(context);
    } else if (useFileSystem()) {
      await fileSystem(context);
    } else if (useCameraBuildIn()) {
      await buildInCamera(context);
    } else {
      'UNIMPLEMENT METHOD HAS BEEN CALLED'.snackbar(context);
    }
    await context.read<ArithmeticListCubit>().init(context);
  }

  Future<void> cameraRoll(BuildContext context) async {
    log('FUNCTION cameraRoll() called');
    final picker = ImagePicker();
    final media = await picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      log('ADA');
      emit(media);
      await extractText(
        from: 'cameraRoll',
        xfile: media,
        context: context,
      );
    } else {
      'CAMERA ROLL, MEDIA IS EMPTY'.snackbar(context);
    }
  }

  Future<void> fileSystem(BuildContext context) async {
    log('FUNCTION fileSystem() called');
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final xFile = result.files.first.xFile;
      emit(xFile);
      await extractText(
        from: 'fileSystem',
        xfile: xFile,
        context: context,
      );
    } else {
      'FILE SYSTEM, MEDIA IS EMPTY'.snackbar(context);
    }
  }

  Future<void> buildInCamera(BuildContext context) async {
    log('FUNCTION buildInCamera() called');
    final picker = ImagePicker();
    final media = await picker.pickImage(source: ImageSource.camera);
    if (media != null) {
      emit(media);
      await extractText(
        from: 'buildInCamera',
        xfile: media,
        context: context,
      );
    } else {
      'BUILD IN CAMERA, MEDIA IS EMPTY'.snackbar(context);
    }
  }

  Future<void> extractText({
    required String from,
    required XFile? xfile,
    required BuildContext context,
  }) async {
    final inputImage = InputImage.fromFilePath(xfile?.path ?? '');
    final textRecognizer = TextRecognizer();
    final recognizedText = await textRecognizer.processImage(inputImage);
    final extractedText = recognizedText.text;
    if (extractedText.isNotEmpty || extractedText != '') {
      try {
        final text = extractedText.firstLine();
        await addToList(
          imagePath: xfile?.path ?? '',
          inputFromMLKit: text,
          result: text.calculatedValue(),
          from: from,
          context: context,
        );
        if (context.read<StorageCubit>().state == UseStorage.file) {
          await saveImage(
            image: xfile?.path ?? '',
            context: context,
          );
        }
      } catch (e) {
        'IMAGE RECOGNIZER, ERROR $e'.snackbar(context);
      }
    } else {
      'IMAGE RECOGNIZER, CANT FIND ANY EXPRESSION'.snackbar(context);
    }
  }

  Future<void> addToList({
    required String imagePath,
    required String inputFromMLKit,
    required String result,
    required String from,
    required BuildContext context,
  }) async {
    if (context.read<StorageCubit>().state == UseStorage.database) {
      await AritmethicRepo().addAritmethic(
        ArithmeticModel(
          imagePath: imagePath,
          inputFromMlKit: inputFromMLKit,
          result: result,
          from: '${from} - ${FlutterConfig.get('APP_SUFFIX_ID')}',
          uint8List: '',
        ),
      );
    } else {
      await AritmethiFileRepo().writeToFile(
        ArithmeticModel(
          imagePath: imagePath,
          inputFromMlKit: inputFromMLKit,
          result: result,
          from: '${from} - ${FlutterConfig.get('APP_SUFFIX_ID')}',
          uint8List: '',
        ),
      );
    }
  }

  Future<void> saveImage({
    required String image,
    required BuildContext context,
  }) async {
    try {
      final captureImage = File(image).readAsBytesSync();
      final directory = await AritmethiFileRepo().getFilePath();
      final path = '$directory/${const Uuid().v1()}.png';
      log('SIAPA PATH $path');
      final imagePath = await File(path).create(recursive: true);
      await imagePath.writeAsBytes(captureImage);
    } catch (e) {
      'CATCH saveImage $e'.snackbar(context);
    }
  }
}
