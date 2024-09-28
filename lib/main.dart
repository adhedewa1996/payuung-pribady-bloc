import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/services/local_storage_services.dart';
import 'package:payuung_pribadi_app/app/commons/services/theme_services.dart';
import 'package:payuung_pribadi_app/app/core/config/theme/theme.dart';
import 'package:payuung_pribadi_app/app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageServices.init(); // LOCAL STORAGE

  await FlutterConfig.loadEnvVariables(); // LOAD ENVIRONMENT

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payuung Pribadi',
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaler.clamp(minScaleFactor: 1, maxScaleFactor: 1.3);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: scale),
          child: GetMaterialApp(
            title: 'Payuung Pribadi',
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: ThemeService().theme,
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            defaultTransition: Transition.rightToLeftWithFade,
          ),
        );
      },
    );
  }
}
