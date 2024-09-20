import 'package:example/app/commons/services/app_connection.dart';
import 'package:example/app/core/dependency_injection/dependency_injection.dart';
import 'package:example/app/core/style/theme/theme.dart';
import 'package:example/app/core/style/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(); // LOCAL STORAGE

  await FlutterConfig.loadEnvVariables(); // LOAD ENVIRONMENT

  await DependencyInjection.init(); // DEPENDENCY INJECTION

  AppConnection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Application',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
