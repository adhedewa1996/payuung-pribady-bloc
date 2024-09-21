import 'package:flutter_config/flutter_config.dart';

enum ApiName { headline, videoViral, infografis }

enum ProgressLoadingType { loading, failed, empty, success, loadmore }

enum UseStorage { file, database }

class AppContants {
  static const String dev = '.dev';
  static const String staging = '.staging';
  static const String production = '';

  // GREEN
  static const String greenCameraRoll = '.green.camera.roll';
  static const String greenFilesystem = '.green.filesystem';

  // RED
  static const String redBuiltInCamera = '.red.built.in.camera';
  static const String redCameraRoll = '.red.camera.roll';

  static final variantNormal = <String>[
    dev,
    staging,
    production,
  ];

  static final variantGreen = <String>[
    greenCameraRoll,
    greenFilesystem,
  ];

  static final variantRed = <String>[
    redBuiltInCamera,
    redCameraRoll,
  ];
}

bool useCameraRoll() {
  return [AppContants.greenCameraRoll, AppContants.redCameraRoll].contains(FlutterConfig.get('APP_SUFFIX_ID'));
}

bool useFileSystem() {
  return [AppContants.greenFilesystem].contains(FlutterConfig.get('APP_SUFFIX_ID'));
}

bool useCameraBuildIn() {
  return [AppContants.redBuiltInCamera].contains(FlutterConfig.get('APP_SUFFIX_ID'));
}
