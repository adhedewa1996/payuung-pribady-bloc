import 'package:calculator_camera/app/bloc/arithmetic/arithmetic_cubit.dart';
import 'package:calculator_camera/app/bloc/arithmetic/arithmetic_list/arithmetic_list_cubit.dart';
import 'package:calculator_camera/app/bloc/storage/storage_cubit.dart';
import 'package:calculator_camera/app/bloc/theme/theme_cubit.dart';
import 'package:calculator_camera/app/common/services/local_storage_services.dart';
import 'package:calculator_camera/app/routing/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<StorageCubit>(
          create: (_) => StorageCubit(),
        ),
        BlocProvider<ArithmeticCubit>(
          create: (_) => ArithmeticCubit(),
        ),
        BlocProvider<ArithmeticListCubit>(
          create: (_) => ArithmeticListCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              theme: theme,
            );
          },
        ),
      ),
    );
  }
}
